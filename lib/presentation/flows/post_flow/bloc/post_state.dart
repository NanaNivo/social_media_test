
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'package:social_media_test/data/models/post_model.dart';
part 'post_state.g.dart';

enum Status {init,success,faild,loading}

@JsonSerializable()
class PostState extends Equatable{
  final Status getPostStatus;
  final Status getCommentStatus;
  final List<Post> postList;
  final List<Comment> commentList;
  final Status getStoryStatus;
  final List<Story> storyList;
 // final String errorLogin;
  const PostState({ this.getPostStatus=Status.init,this.postList=const[],this.getCommentStatus=Status.init,this.commentList=const [],this.getStoryStatus=Status.init,this.storyList=const[]});

  PostState copyWith({
    Status? getPostStatus,
    Status? getCommentStatus,
    List<Post>? postList,
    List<Comment>? commentList,
    Status? getStoryStatus,
    List<Story>? storyList
  //  String? errorLogin,
  }){
    return PostState(getPostStatus:getPostStatus??this.getPostStatus,postList:postList??this.postList,getCommentStatus:getCommentStatus??this.getCommentStatus,commentList: commentList??this.commentList ,getStoryStatus: getStoryStatus??this.getStoryStatus,storyList:storyList?? this.storyList );
  }


  factory PostState.fromJson(Map<String, dynamic> json) =>
      _$PostStateFromJson(json);

  Map<String, dynamic> toJson() => _$PostStateToJson(this);

  @override
  // TODO: implement props
  List<Object?> get props => [getPostStatus,postList,getCommentStatus,commentList,getStoryStatus,storyList];

}