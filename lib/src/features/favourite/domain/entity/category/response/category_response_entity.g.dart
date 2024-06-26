// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_response_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoryResponseEntity _$CategoryResponseEntityFromJson(
        Map<String, dynamic> json) =>
    CategoryResponseEntity(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      description: json['description'] as String?,
      countList: (json['countList'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList(),
    );

Map<String, dynamic> _$CategoryResponseEntityToJson(
        CategoryResponseEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'countList': instance.countList,
    };
