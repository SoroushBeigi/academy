import 'package:academy/src/features/favourite/domain/entity/entity.dart';
import 'package:academy/src/services/network/network.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';



@LazySingleton()
class GetAllContentDataSource with ApiBase<List<ContentResponseEntity>> {
  final DioClient _dioClient = DioClient();

  Future<List<ContentResponseEntity>> getAllContents() async {
    final response = await makeGetRequest(
      _dioClient.dio.get(ApiConfig.getAllContent),
    );

    if (response.statusCode == 200) {
      List<ContentResponseEntity> contentsList = (response.data as List)
          .map((item) => ContentResponseEntity.fromJson(item))
          .toList();
      return contentsList;
    } else {
      throw Exception('Failed to load contents');
    }
  }
}

@LazySingleton()
class DeleteContentDataSource with ApiBase {
  final DioClient _dioClient = DioClient();
  Dio dio = Dio();

  Future deleteContent({required String id}) async {
    try {
      int? newId = int.tryParse(id);
      final response = await makeDeleteRequest(
        _dioClient.dio.request(
          '${ApiConfig.content}/$id',
          data: {
            'id': newId,
          },
          options: Options(
            method: 'DELETE',
          ),
        ),
      );
      return response.data;
    }on DioException catch(e) {
      debugPrint(e.message);
    }
  }
}

@LazySingleton()
class PutContentDataSource with ApiBase<ContentResponseEntity> {
  final DioClient _dioClient = DioClient();

  Future<ContentResponseEntity?> putContent({required ContentResponseEntity entity}) async {
    try {
      final response = await makePutRequest(
        _dioClient.dio.put(
          '${ApiConfig.content}/${entity.id}',
          data: entity.toJson(),
        ),
      );
      return ContentResponseEntity.fromJson(response.data);
    } on DioException catch(e) {
      debugPrint(e.message);
    }
    return null;
  }
}