
import 'package:json_annotation/json_annotation.dart';

part 'category_response_entity.g.dart';

@JsonSerializable()
class CategoryResponseEntity {
  int? id;
  String? name;
  String? description;

  CategoryResponseEntity({this.id, this.name, this.description});

  factory CategoryResponseEntity.fromJson(Map<String, dynamic> json) => _$CategoryResponseEntityFromJson(json);

}