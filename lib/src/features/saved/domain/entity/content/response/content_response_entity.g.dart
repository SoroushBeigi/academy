// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'content_response_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ContentResponseEntity _$ContentResponseEntityFromJson(
        Map<String, dynamic> json) =>
    ContentResponseEntity(
      likesCount: (json['likes_count'] as num?)?.toInt(),
      relatedContentIds: (json['related_content_ids'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList(),
      id: (json['id'] as num?)?.toInt(),
      title: json['title'] as String?,
      description: json['description'] as String?,
      url: json['url'] as String?,
      categoryId: (json['category_ids'] as num?)?.toInt(),
      authorId: (json['author_id'] as num?)?.toInt(),
      authorName: json['author_name'] as String?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      imageUrl: json['image_url'] as String?,
      viewCount: (json['view_count'] as num?)?.toInt(),
      duration: json['duration'] as String?,
      isLive: json['is_live'] as bool?,
      mainFilePath: json['main_file_path'] as String?,
      mainFileType: json['main_file_type'] as String?,
      categories: (json['categories'] as List<dynamic>?)
          ?.map(
              (e) => CategoryResponseEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      attachments: (json['attachments'] as List<dynamic>?)
          ?.map((e) =>
              AttachmentResponseEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      comments: (json['comments'] as List<dynamic>?)
          ?.map(
              (e) => CommentResponseEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      tags: (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList(),
      isApproved: json['is_approved'] as bool?,
    );

Map<String, dynamic> _$ContentResponseEntityToJson(
        ContentResponseEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'url': instance.url,
      'category_ids': instance.categoryId,
      'author_id': instance.authorId,
      'author_name': instance.authorName,
      'created_at': instance.createdAt?.toIso8601String(),
      'image_url': instance.imageUrl,
      'view_count': instance.viewCount,
      'duration': instance.duration,
      'is_live': instance.isLive,
      'main_file_path': instance.mainFilePath,
      'main_file_type': instance.mainFileType,
      'categories': instance.categories,
      'attachments': instance.attachments,
      'comments': instance.comments,
      'tags': instance.tags,
      'related_content_ids': instance.relatedContentIds,
      'is_approved': instance.isApproved,
      'likes_count': instance.likesCount,
    };
