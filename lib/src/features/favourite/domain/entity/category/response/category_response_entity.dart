
import 'package:json_annotation/json_annotation.dart';

part 'category_response_entity.g.dart';

@JsonSerializable()
class CategoryResponseEntity {
  int? id;
  String? name;
  String? description;
  List<int>? countList;

  CategoryResponseEntity({this.id, this.name, this.description, this.countList});

  factory CategoryResponseEntity.fromJson(Map<String, dynamic> json) => _$CategoryResponseEntityFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryResponseEntityToJson(this);

}