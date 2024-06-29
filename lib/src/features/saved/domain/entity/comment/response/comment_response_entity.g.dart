// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment_response_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommentResponseEntity _$CommentResponseEntityFromJson(
        Map<String, dynamic> json) =>
    CommentResponseEntity(
      id: (json['id'] as num?)?.toInt(),
      contentId: (json['content_id'] as num?)?.toInt(),
      userId: (json['user_id'] as num?)?.toInt(),
      text: json['text'] as String?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$CommentResponseEntityToJson(
        CommentResponseEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'content_id': instance.contentId,
      'user_id': instance.userId,
      'text': instance.text,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
    };
