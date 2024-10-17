// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostState _$PostStateFromJson(Map<String, dynamic> json) => PostState(
      getPostStatus:
          $enumDecodeNullable(_$StatusEnumMap, json['getPostStatus']) ??
              Status.init,
      postList: (json['postList'] as List<dynamic>?)
              ?.map((e) => Post.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      getCommentStatus:
          $enumDecodeNullable(_$StatusEnumMap, json['getCommentStatus']) ??
              Status.init,
      commentList: (json['commentList'] as List<dynamic>?)
              ?.map((e) => Comment.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      getStoryStatus:
          $enumDecodeNullable(_$StatusEnumMap, json['getStoryStatus']) ??
              Status.init,
      storyList: (json['storyList'] as List<dynamic>?)
              ?.map((e) => Story.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$PostStateToJson(PostState instance) => <String, dynamic>{
      'getPostStatus': _$StatusEnumMap[instance.getPostStatus]!,
      'getCommentStatus': _$StatusEnumMap[instance.getCommentStatus]!,
      'postList': instance.postList,
      'commentList': instance.commentList,
      'getStoryStatus': _$StatusEnumMap[instance.getStoryStatus]!,
      'storyList': instance.storyList,
    };

const _$StatusEnumMap = {
  Status.init: 'init',
  Status.success: 'success',
  Status.faild: 'faild',
  Status.loading: 'loading',
};
