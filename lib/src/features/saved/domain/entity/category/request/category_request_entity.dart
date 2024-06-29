
import 'package:json_annotation/json_annotation.dart';

part 'category_request_entity.g.dart';

@JsonSerializable()
class CategoryRequestEntity {
  int? id;
  String? name;
  String? description;

  CategoryRequestEntity({this.id, this.name, this.description});

  Map<String, dynamic> toJson() => _$CategoryRequestEntityToJson(this);
}