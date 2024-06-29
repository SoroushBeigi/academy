import 'package:academy/src/features/favourite/domain/entity/entity.dart';
import 'package:json_annotation/json_annotation.dart';
part 'content_response_entity.g.dart';

@JsonSerializable()
class ContentResponseEntity {
  @JsonKey(name: 'id')
  final int? id;
  @JsonKey(name: 'title')
  final String? title;
  @JsonKey(name: 'description')
  final String? description;
  @JsonKey(name: 'url')
  final String? url;
  @JsonKey(name: 'category_ids')
  final int? categoryId;
  @JsonKey(name: 'author_id')
  final int? authorId;
  @JsonKey(name: 'author_name')
  final String? authorName;
  @JsonKey(name: 'created_at')
  final DateTime? createdAt;
  @JsonKey(name: 'image_url')
  final String? imageUrl;
  @JsonKey(name: 'view_count')
  final int? viewCount;
  @JsonKey(name: 'duration')
  final String? duration;
  @JsonKey(name: 'is_live')
  final bool? isLive;
  @JsonKey(name: 'main_file_path')
  final String? mainFilePath;
  @JsonKey(name: 'main_file_type')
  final String? mainFileType;
  @JsonKey(name: 'categories')
  final List<CategoryResponseEntity>? categories;
  @JsonKey(name: 'attachments')
  final List<AttachmentResponseEntity>? attachments;
  @JsonKey(name: 'comments')
  List<CommentResponseEntity>? comments;
  final List<String>? tags;
  @JsonKey(name: 'related_content_ids')
  final List<int>? relatedContentIds;
  @JsonKey(name: 'is_approved')
  bool? isApproved;
  @JsonKey(name: 'likes_count')
  final int? likesCount;

  ContentResponseEntity({
    this.likesCount,
    this.relatedContentIds,
    this.id,
    this.title,
    this.description,
    this.url,
    this.categoryId,
    this.authorId,
    this.authorName,
    this.createdAt,
    this.imageUrl,
    this.viewCount,
    this.duration,
    this.isLive,
    this.mainFilePath,
    this.mainFileType,
    this.categories,
    this.attachments,
    this.comments,
    this.tags,
    this.isApproved,
  });

  factory ContentResponseEntity.fromJson(Map<String, dynamic> json) => _$ContentResponseEntityFromJson(json);

  Map<String, dynamic> toJson() => _$ContentResponseEntityToJson(this);
}