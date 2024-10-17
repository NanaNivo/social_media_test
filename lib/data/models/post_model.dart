import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class Post {
  int? id;
  String? content;
  String? date;
  String? imageUser;
  int? likesCount;
  String? name;
  String? imageContent;

  Post({this.id,this.content, this.date, this.imageUser, this.likesCount, this.name,this.imageContent});

  Post.fromJson(Map<String, dynamic> json) {
    id=json['id'];
    content = json['content'];
    date = json['date'];
    imageUser = json['imageUser'];
    likesCount = json['likes_count'];
    name = json['name'];
    imageContent=json['imageContent'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['content'] = this.content;
    data['date'] = this.date;
    data['imageUser'] = this.imageUser;
    data['likes_count'] = this.likesCount;
    data['name'] = this.name;
    data['imageContent']=this.imageContent;
    return data;
  }
}

@JsonSerializable()
class Story {
  int? id;

  String? date;
  String? image_user;

  String? name;
  String? image_content;

  Story({this.id, this.date, this.image_content, this.image_user, this.name});

  Story.fromJson(Map<String, dynamic> json) {
    id=json['id'];

    date = json['date'];
    image_user = json['image_user'];

    name = json['name'];
    image_content=json['image_content'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['date'] = this.date;
    data['image_user'] = this.image_user;

    data['name'] = this.name;
    data['image_content']=this.image_content;
    return data;
  }
}
@JsonSerializable()
class Comment {
  String? content;

  String? image_user;
  int? postId;


  Comment({this.content, this.image_user, this.postId});

  Comment.fromJson(Map<String, dynamic> json) {
    content = json['content'];

    image_user = json['image_user'];
    postId = json['postId'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['content'] = this.content;
    data['image_user'] = this.image_user;
    data['postId'] = this.postId;

    return data;
  }
}
