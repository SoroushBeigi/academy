
import 'package:json_annotation/json_annotation.dart';
part 'comment_request_entity.g.dart';

@JsonSerializable()
class CommentRequestEntity {
  @JsonKey(name: 'user_id')
  int? userId;
  @JsonKey(name: 'content_id')
  int? contentId;
  String? text;

  CommentRequestEntity({this.userId, this.contentId, this.text});

  Map<String, dynamic> toJson() => _$CommentRequestEntityToJson(this);
}