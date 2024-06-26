import 'package:json_annotation/json_annotation.dart';

part 'comment_response_entity.g.dart';

@JsonSerializable()

class CommentResponseEntity {
  @JsonKey(name: 'id')
  final int? id;
  @JsonKey(name: 'content_id')
  final int? contentId;
  @JsonKey(name: 'user_id')
  final int? userId;
  @JsonKey(name: 'text')
  final String? text;
  @JsonKey(name: 'created_at')
  final DateTime? createdAt;
  @JsonKey(name: 'updated_at')
  final DateTime? updatedAt;

  CommentResponseEntity({
    this.id,
    this.contentId,
    this.userId,
    this.text,
    this.createdAt,
    this.updatedAt,
  });
  factory CommentResponseEntity.fromJson(Map<String, dynamic> json) => _$CommentResponseEntityFromJson(json);

  Map<String, dynamic> toJson() => _$CommentResponseEntityToJson(this);
}