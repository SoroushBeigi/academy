// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_request_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoryRequestEntity _$CategoryRequestEntityFromJson(
        Map<String, dynamic> json) =>
    CategoryRequestEntity(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$CategoryRequestEntityToJson(
        CategoryRequestEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
    };
