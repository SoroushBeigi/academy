// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attachment_response_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AttachmentResponseEntity _$AttachmentResponseEntityFromJson(
        Map<String, dynamic> json) =>
    AttachmentResponseEntity(
      id: (json['id'] as num?)?.toInt(),
      contentId: (json['content_id'] as num?)?.toInt(),
      filePath: json['file_path'] as String?,
      fileType: json['file_type'] as String?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$AttachmentResponseEntityToJson(
        AttachmentResponseEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'content_id': instance.contentId,
      'file_path': instance.filePath,
      'file_type': instance.fileType,
      'created_at': instance.createdAt?.toIso8601String(),
    };
