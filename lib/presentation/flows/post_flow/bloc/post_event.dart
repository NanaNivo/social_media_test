
import 'package:social_media_test/data/models/post_model.dart';
import 'package:social_media_test/data/models/user.dart';

class PostEvent
{

}
class GetPostEvent extends PostEvent
{

}
class FillPostList extends PostEvent
{
   Post post;
   FillPostList({required this.post});
}


class FillStoryList extends PostEvent
{
   Story story;
   FillStoryList({required this.story});
}

class FillCommentList extends PostEvent
{
   Comment comment;
   FillCommentList({required this.comment});
}
class GetComment extends PostEvent
{
   int postId;
   GetComment({required this.postId});
}
class GetStory extends PostEvent
{

}




// class AddTaskEvent extends TaskEvent
// {
//  final User user;
//  AddTaskEvent({required this.user});
//
// }
// class DeletTaskEvent extends TaskEvent
// {
//   final int id;
//   DeletTaskEvent({required this.id});
// }
// class UpdateTaskEvent extends TaskEvent
// {
//   final User user;
//   UpdateTaskEvent({required this.user});
// }


