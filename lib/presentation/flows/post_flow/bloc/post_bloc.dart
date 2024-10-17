

import 'dart:convert';

import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:social_media_test/core/error/base_error.dart';
import 'package:social_media_test/core/mediators/communication_types/base_communication.dart';
import 'package:social_media_test/data/models/post_model.dart';
import 'package:social_media_test/data/requests/post_request.dart';
import 'package:social_media_test/domain/usecases/post_usecases.dart';
import 'package:social_media_test/presentation/custom_widgets/infinite_list_view/model.dart';
import 'package:social_media_test/presentation/flows/post_flow/bloc/post_state.dart';

import '../../../../core/mediators/bloc_hub/bloc_member.dart';
import 'package:bloc/bloc.dart';
//
import 'package:social_media_test/presentation/flows/post_flow/bloc/post_event.dart';


class PostBloc extends HydratedBloc<PostEvent, PostState> with BlocMember
{

   final GetPostUseCase getPostUseCase;
   final GetCommentUseCase getCommentUseCase;
   final GetStoryUseCase getStoryUseCase;
//   // final DeletTaskUseCase deletTaskUseCase;
//   // final GetTaskUseCase getTaskUseCase;
//   // final UpdateTaskUseCase updateTaskUseCase;
  PostBloc({required this.getPostUseCase,required this.getCommentUseCase,required this.getStoryUseCase}): super(const PostState()){
         on<GetPostEvent>(_onGetPostEvent);
         on<FillPostList>(_onFillPostList);
         on<FillStoryList>(_onFilStoryList);
         on<GetComment>(_onGetComment);
         on<FillCommentList>(_onFillCommeentList);
         on<GetStory>(_onGetStoryEvent);
//   //   on<DeletTaskEvent>(_onDeletTask);
//   //   on<UpdateTaskEvent>(_onUpdateTask);
        }
//
  @override
  void receive(String from, CommunicationType data) {

  }

  @override
  PostState? fromJson(Map<String, dynamic> json) {
    return PostState.fromJson(json);
  }

  @override
  Map<String, dynamic>? toJson(PostState state) {
    return state.toJson();
  }
//
 }
extension PostBlocMappers on PostBloc {



  void _onGetPostEvent(GetPostEvent event, Emitter<PostState > emit) async {
      emit(state.copyWith(getPostStatus: Status.loading));
        final result=await getPostUseCase(GetPostParms(getPostRequest: GetPostRequest( )));
        print('result befor data${result.error.toString()}');
              if(result.hasDataOnly)
              {
                emit(state.copyWith(postList: []));
                result.data!.onData((data) {
                  Map<String, dynamic> result = jsonDecode(jsonEncode(data.snapshot.value));
                     print("data in GetPostEvent${Post.fromJson(result)}");
                   Post  postTemp=Post.fromJson(result);
                     add(FillPostList(post:postTemp ));
                });

      emit(state.copyWith(getPostStatus: Status.success));
    }else if(result.error==StringError(error:'No internet connection'))
    {
      print("im here${state.toJson()}");
      emit(state.copyWith(getPostStatus: Status.success));
    }

    else{
      emit(state.copyWith(getPostStatus: Status.faild));
    }
  }


  void _onGetStoryEvent(GetStory event, Emitter<PostState > emit) async {
    emit(state.copyWith(getStoryStatus: Status.loading));
    final result=await getStoryUseCase(GetStoryParms(getStoryRequest: GetStoryRequest( )));
    print('result befor data${result.error.toString()}');
    if(result.hasDataOnly)
    {
      emit(state.copyWith(storyList: []));
      result.data!.onData((data) {
        Map<String, dynamic> result = jsonDecode(jsonEncode(data.snapshot.value));
        print("data in GetPostEvent${Story.fromJson(result)}");
        Story  story=Story.fromJson(result);
        add(FillStoryList(story:story ));
      });

      emit(state.copyWith(getPostStatus: Status.success));
    }else if(result.error==StringError(error:'No internet connection'))
    {
      print("im here${state.toJson()}");
      emit(state.copyWith(getStoryStatus: Status.success));
    }

    else{
      emit(state.copyWith(getPostStatus: Status.faild));
    }
  }

  void _onFillPostList(FillPostList event,Emitter<PostState > emit) async
  {
     List<Post> postListTemp=List.of(state.postList);
     postListTemp.add(event.post);

     emit(state.copyWith(postList:postListTemp ));
  }


  void _onFilStoryList(FillStoryList event,Emitter<PostState > emit) async
  {
    List<Story> storyListTemp=List.of(state.storyList);
    storyListTemp.add(event.story);

    emit(state.copyWith(storyList:storyListTemp ));
  }

  void _onFillCommeentList(FillCommentList event,Emitter<PostState > emit) async
  {
    List<Comment> commentListTemp=List.of(state.commentList);
    commentListTemp.add(event.comment);
    emit(state.copyWith(commentList:commentListTemp ));
  }


  void _onGetComment(GetComment event, Emitter<PostState > emit) async
  {
    emit(state.copyWith(getCommentStatus: Status.loading,commentList: []));
    final result=await getCommentUseCase(GetCommentParms(getCommentRequest: GetCommentRequest(postId: event.postId )));
    if(result.hasDataOnly)
    {
      result.data!.onData((data) {
        Map<String, dynamic> result = jsonDecode(jsonEncode(data.snapshot.value));
        print("data in GetCommentEvent${Comment.fromJson(result)}");
        Comment  commentTemp=Comment.fromJson(result);
        add(FillCommentList(comment:commentTemp ));
      });

      emit(state.copyWith(getCommentStatus: Status.success));
    } else if(result.error==StringError(error:'No internet connection'))
      {
        emit(state.copyWith(getCommentStatus: Status.success));
      } else{
      print("faild on comment");
      emit(state.copyWith(getCommentStatus: Status.faild));
    }
  }

  }

//
//   void _onUpdateTask(UpdateTaskEvent event, Emitter<TaskState > emit) async {
//     emit(state.copyWith(addedStatus: AddedStatus.loading));
//   //  final result=await updateTaskUseCase(UpdateTaskParms(updateTaskRequest: UpdateTaskRequest( id: event.user.id!,name: event.user.firstName??'',job: event.user.job??'')));
//   //   if(result.hasDataOnly)
//   //   {
//   //     emit(state.copyWith(addedStatus: AddedStatus.success));
//   //   }
//   //   else{
//   //     emit(state.copyWith(addedStatus: AddedStatus.faild));
//   //   }
//   }
//
//   void _onDeletTask(DeletTaskEvent event, Emitter<TaskState > emit) async {
//     emit(state.copyWith(addedStatus: AddedStatus.loading));
//   //  final result=await deletTaskUseCase(DeletTaskParms(deletTaskRequest: DeletTaskRequest( id: event.id)));
//   //   if(result.hasDataOnly)
//   //   {
//   //     emit(state.copyWith(addedStatus: AddedStatus.success));
//   //   }
//   //   else{
//   //     emit(state.copyWith(addedStatus: AddedStatus.faild));
//   //   }
//   }
// }