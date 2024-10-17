

import 'package:social_media_test/core/request/request.dart';
import 'package:social_media_test/core/response/api_response.dart';
import 'package:social_media_test/data/models/user.dart';

// class AddTaskRequest extends Request {
//   final String name;
//
//   final String job;
//
//   AddTaskRequest({required this.name, required this.job});
//
//   @override
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> map = <String, dynamic>{};
//     map['name']=name;
//     map['job']=job;
//     return map;
//   }
// }


class GetPostRequest extends Request {

   // final int page;
   // final int limit;
   GetPostRequest();

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> map = <String, dynamic>{};
   //  map['page']=page;
    // map['job']=job;
    return map;
  }
}

class GetStoryRequest extends Request {

  // final int page;
  // final int limit;
  //GetStoryRequest();

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> map = <String, dynamic>{};
    //  map['page']=page;
    // map['job']=job;
    return map;
  }
}


class GetCommentRequest extends Request {

  // final int page;
  // final int limit;
  final int postId;
  GetCommentRequest({required this.postId});

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> map = <String, dynamic>{};
      map['postId']=postId;
    // map['job']=job;
    return map;
  }
}


// class UpdateTaskRequest extends Request {
//   final String name;
//
//   final String job;
//   final int id;
//
//   UpdateTaskRequest({required this.name, required this.job,required this.id});
//
//   @override
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> map = <String, dynamic>{};
//     map['name']=name;
//     map['job']=job;
//     return map;
//   }
// }
//
// class DeletTaskRequest extends Request {
//   final int id;
//
//
//
//   DeletTaskRequest({required this.id});
//
//   @override
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> map = <String, dynamic>{};
//     map['id']=id;
//
//     return map;
//   }
// }



