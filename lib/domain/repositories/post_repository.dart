

import 'dart:async';

import 'package:social_media_test/core/error/base_error.dart';
import 'package:social_media_test/core/repositories/repository.dart';
import 'package:social_media_test/core/result/result.dart';
import 'package:social_media_test/data/models/user.dart';
import 'package:social_media_test/data/requests/post_request.dart';

abstract class PostRepository extends Repository
{
  Future<Result<BaseError, StreamSubscription>> getPostItemsRepo(GetPostRequest getPostRequest);
  Future<Result<BaseError, StreamSubscription>> getCommentItemsRepo(GetCommentRequest getCommentRequest);
  Future<Result<BaseError, StreamSubscription>> getStoryItemsRepo(
      GetStoryRequest getStoryRequest);
  // Future<Result<BaseError, User>> AddTaskRepo(AddTaskRequest addTaskRequest);
  // Future<Result<BaseError, bool>> DeletTaskRepo( DeletTaskRequest deletTaskRequest);
  // Future<Result<BaseError, List<User>>> getTaskItemsRepo( GetTaskRequest getTaskRequest);
  // Future<Result<BaseError, User>> updateTaskItemRepo(UpdateTaskRequest updateTaskRequest);
}