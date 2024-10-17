//
// import 'package:connectivity_plus/connectivity_plus.dart';
// import 'package:dartz/dartz.dart';
// import 'package:social_media_test/core/error/base_error.dart';
// import 'package:social_media_test/core/result/result.dart';
// import 'package:social_media_test/data/datasources/local_data_source/cart/task_data_sourse.dart';
// import 'package:social_media_test/data/models/user.dart';
// import 'package:social_media_test/data/requests/post_request.dart';
// import 'package:social_media_test/domain/repositories/post_repository.dart';
//
import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:social_media_test/app+injection/di.dart';
import 'package:social_media_test/core/error/base_error.dart';
import 'package:social_media_test/core/result/result.dart';
import 'package:social_media_test/data/requests/post_request.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:social_media_test/domain/repositories/post_repository.dart';

class PostRepositoryImpl extends PostRepository {
  //final TaskDataSource taskDataSource;
  final FirebaseDatabase firebaseDatabase;

  PostRepositoryImpl({required this.firebaseDatabase});

  // @override
  // Future<Result<BaseError, User>> AddTaskRepo(
  //     AddTaskRequest addTaskRequest) async {
  //   final result = await taskDataSource.insertTaskItem(addTaskRequest);
  //   if (result.isRight()) {
  //     await taskDataSource.insertTaskItemLocal(
  //         (result as Right<BaseError, User>).value);
  //   }
  //   return executeWithoutConvert(remoteResult: result);
  // }

  @override
  Future<Result<BaseError, StreamSubscription>> getPostItemsRepo(
      GetPostRequest getPostRequest) async {
    try {
      var connectivityResult = await Connectivity().checkConnectivity();
        if(connectivityResult == ConnectivityResult.none) {
          print('ggggjhgkj');
          return Result(error: StringError(error: "No internet connection"));
        }
        else
          {
            final postRef = firebaseDatabase.ref("post");
            final StreamSubscription<DatabaseEvent> postListen= postRef.onChildAdded.listen((event){print("event database${event.snapshot.value}");});
            return Result(data: postListen);
          }


    } on FirebaseException catch (e) {
      print("error in Firebase${e}");
      return Result(error: StringError(error: e));
    } catch (e) {
      return Result(error: StringError(error: 'No internet connection'));
    }
      }




  @override
  Future<Result<BaseError, StreamSubscription>> getCommentItemsRepo(
      GetCommentRequest getCommentRequest) async {
    try {
      var connectivityResult = await Connectivity().checkConnectivity();
      if(connectivityResult == ConnectivityResult.none) {
        return Result(error: StringError(error: "No internet connection"));
      }
      else {
        final commentRef = firebaseDatabase.ref(
            "post/post${getCommentRequest.postId}/comments");
        final StreamSubscription<DatabaseEvent> commentListen = commentRef
            .onChildAdded.listen((event) {
          print("event database${event.snapshot.value}");
        });
        return Result(data: commentListen);
      }

    } on FirebaseException catch (e) {
      print("error in Firebase${e}");
      return Result(error: StringError(error: e));
    }  catch (e) {
      return Result(error: StringError(error: 'No internet connection'));
    }
  }



  @override
  Future<Result<BaseError, StreamSubscription>> getStoryItemsRepo(
      GetStoryRequest getStoryRequest) async {
    try {
      var connectivityResult = await Connectivity().checkConnectivity();
      if(connectivityResult == ConnectivityResult.none) {
        return Result(error: StringError(error: "No internet connection"));
      }
      else {
        final storyRef = firebaseDatabase.ref(
            "story");
        final StreamSubscription<DatabaseEvent> commentListen = storyRef
            .onChildAdded.listen((event) {
          print("event database${event.snapshot.value}");
        });
        return Result(data: commentListen);
      }

    } on FirebaseException catch (e) {
      print("error in Firebase${e}");
      return Result(error: StringError(error: e));
    }  catch (e) {
      return Result(error: StringError(error: 'No internet connection'));
    }
  }


  }

//
//   @override
//   Future<Result<BaseError, bool>> DeletTaskRepo(DeletTaskRequest deletTaskRequest) async {
//     final result = await taskDataSource.deleteTaskItem(deletTaskRequest);
//     if(result.isRight())
//     {
//       await taskDataSource.deleteTaskItemLocal(deletTaskRequest.id);
//     }
//     return executeWithoutConvert(remoteResult: result);
//   }
//
//   @override
//   Future<Result<BaseError, List<User>>> getTaskItemsRepo(GetTaskRequest getTaskRequest) async {
//     final List<ConnectivityResult> connectivityResult = await (Connectivity().checkConnectivity());
//       if(connectivityResult.contains(ConnectivityResult.mobile)||connectivityResult.contains(ConnectivityResult.wifi))
//       {
//         final result = await taskDataSource.getTaskItems(getTaskRequest);
//         if (result.isRight()) {
//           var temp = (result as Right<BaseError, List<User>>).value;
//           if (!await taskDataSource.checkIfItemsExists(temp)) {
//             for(int i=0;i<temp.length;i++)
//               {
//                 await taskDataSource.insertTaskItemLocal(temp[i]);
//               }
//
//           }
//           // else
//           //   {
//           //     await taskDataSource.getTaskItemsLocal();
//           //   }
//         }
//         return executeWithoutConvert(remoteResult: result);
//       }
//       else
//         {
//          final res= await taskDataSource.getTaskItemsLocal();
//         final temp= Result(data: res);
//           return temp;
//         }
//
//   }
//
//
//
//
//   @override
//   Future<Result<BaseError, User>> updateTaskItemRepo(UpdateTaskRequest updateTaskRequest) async {
//     final result = await taskDataSource.updateTaskItem(updateTaskRequest);
//     if(result.isRight())
//     {
//       await taskDataSource.updateTaskItemLocal((result as Right<BaseError, User>).value);
//     }
//     return executeWithoutConvert(remoteResult: result);
//   }
//
//
//
// }