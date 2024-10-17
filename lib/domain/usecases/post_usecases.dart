//
// import 'package:social_media_test/core/error/base_error.dart';
// import 'package:social_media_test/core/result/result.dart';
// import 'package:social_media_test/core/usecases/base_use_case.dart';
// import 'package:social_media_test/data/models/user.dart';
// import 'package:social_media_test/data/requests/task_request.dart';
// import 'package:social_media_test/domain/repositories/post_repository.dart';
//
// class AddTaskParms
// {
//   AddTaskRequest addTaskRequest;
//   AddTaskParms({required this.addTaskRequest});
// }
// class AddTaskUseCase extends UseCase<Future<Result<BaseError,User>>,AddTaskParms> {
//   final TaskRepository taskRepository;
//   // final deviceInfoService=locator<DeviceInfoService>();
//   AddTaskUseCase({required this.taskRepository});
//   @override
//   Future<Result<BaseError, User>> call(AddTaskParms params) async {
//
//
//     return taskRepository.AddTaskRepo(params.addTaskRequest);
//
//   }
//
//
// }
//
//
// class DeletTaskParms
// {
//   DeletTaskRequest deletTaskRequest;
//   DeletTaskParms({required this.deletTaskRequest});
// }
// class DeletTaskUseCase extends UseCase<Future<Result<BaseError,bool>>,DeletTaskParms> {
//   final TaskRepository taskRepository;
//   // final deviceInfoService=locator<DeviceInfoService>();
//   DeletTaskUseCase({required this.taskRepository});
//   @override
//   Future<Result<BaseError, bool>> call(DeletTaskParms params) async {
//     return taskRepository.DeletTaskRepo(params.deletTaskRequest);
//   }
// }
//
//
// class UpdateTaskParms
// {
//   UpdateTaskRequest updateTaskRequest;
//   UpdateTaskParms({required this.updateTaskRequest});
// }
// class UpdateTaskUseCase extends UseCase<Future<Result<BaseError,User>>,UpdateTaskParms> {
//   final TaskRepository taskRepository;
//   // final deviceInfoService=locator<DeviceInfoService>();
//   UpdateTaskUseCase({required this.taskRepository});
//   @override
//   Future<Result<BaseError, User>> call(UpdateTaskParms params) async {
//     return taskRepository.updateTaskItemRepo(params.updateTaskRequest);
//   }
// }
//
//
import 'dart:async';

import 'package:social_media_test/core/error/base_error.dart';
import 'package:social_media_test/core/result/result.dart';
import 'package:social_media_test/core/usecases/base_use_case.dart';
import 'package:social_media_test/data/requests/post_request.dart';
import 'package:social_media_test/domain/repositories/post_repository.dart';

class GetPostParms
{
  GetPostRequest getPostRequest;
  GetPostParms({required this.getPostRequest});
}


class GetStoryParms
{
  GetStoryRequest getStoryRequest;
  GetStoryParms({required this.getStoryRequest});
}



class GetCommentParms
{
  GetCommentRequest getCommentRequest;
  GetCommentParms({required this.getCommentRequest});
}
class GetPostUseCase extends UseCase<Future<Result<BaseError,StreamSubscription>>,GetPostParms> {
  final PostRepository postRepository;
  // final deviceInfoService=locator<DeviceInfoService>();
  GetPostUseCase({required this.postRepository});
  @override
  Future<Result<BaseError, StreamSubscription>> call(GetPostParms params) async {
    return postRepository.getPostItemsRepo(params.getPostRequest);
  }
}


class GetCommentUseCase extends UseCase<Future<Result<BaseError,StreamSubscription>>,GetCommentParms> {
  final PostRepository postRepository;
  // final deviceInfoService=locator<DeviceInfoService>();
  GetCommentUseCase({required this.postRepository});
  @override
  Future<Result<BaseError, StreamSubscription>> call(GetCommentParms params) async {
    return postRepository.getCommentItemsRepo(params.getCommentRequest);
  }
}


class GetStoryUseCase extends UseCase<Future<Result<BaseError,StreamSubscription>>,GetStoryParms> {
  final PostRepository postRepository;
  // final deviceInfoService=locator<DeviceInfoService>();
  GetStoryUseCase({required this.postRepository});
  @override
  Future<Result<BaseError, StreamSubscription>> call( params) async {
    return postRepository.getStoryItemsRepo(params.getStoryRequest);
  }
}