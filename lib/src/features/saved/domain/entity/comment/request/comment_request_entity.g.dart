// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment_request_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommentRequestEntity _$CommentRequestEntityFromJson(
        Map<String, dynamic> json) =>
    CommentRequestEntity(
      userId: (json['user_id'] as num?)?.toInt(),
      contentId: (json['content_id'] as num?)?.toInt(),
      text: json['text'] as String?,
    );

Map<String, dynamic> _$CommentRequestEntityToJson(
        CommentRequestEntity instance) =>
    <String, dynamic>{
      'user_id': instance.userId,
      'content_id': instance.contentId,
      'text': instance.text,
    };
