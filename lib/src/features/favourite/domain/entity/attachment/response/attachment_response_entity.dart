import 'package:json_annotation/json_annotation.dart';

part 'attachment_response_entity.g.dart';

@JsonSerializable()
class AttachmentResponseEntity {
  final int? id;
  @JsonKey(name: 'content_id')
  final int? contentId;
  @JsonKey(name: 'file_path')
  final String? filePath;
  @JsonKey(name: 'file_type')
  final String? fileType;
  @JsonKey(name: 'created_at')
  final DateTime? createdAt;

  AttachmentResponseEntity({
    this.id,
    this.contentId,
    this.filePath,
    this.fileType,
    this.createdAt,
  });

  factory AttachmentResponseEntity.fromJson(Map<String, dynamic> json) => _$AttachmentResponseEntityFromJson(json);

  Map<String, dynamic> toJson() => _$AttachmentResponseEntityToJson(this);

}