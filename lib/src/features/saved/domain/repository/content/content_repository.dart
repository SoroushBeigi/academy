import 'package:academy/src/features/saved/saved.dart';
import 'package:academy/src/services/network/network.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';



@lazySingleton
class DeleteContentRepository with GeneralRepository {
  final DeleteContentDataSource deleteContentDataSource;

  DeleteContentRepository({required this.deleteContentDataSource});

  Future<ApiResult> deleteContent({required String id}) async {
    try {
      final response = await deleteContentDataSource.deleteContent(id: id);
      return ApiResult.success(data: response);
    } on DioException catch (e) {
      return ApiResult.failure(error: e.response?.data['message'].toString());
    }
  }
}

@lazySingleton
class GetAllContentRepository with GeneralRepository<List<ContentResponseEntity>> {
  final GetAllContentDataSource getAllContentDataSource;

  GetAllContentRepository({required this.getAllContentDataSource});

  Future<ApiResult<List<ContentResponseEntity>>> getAllContent() async {
    try {
      final response = await getAllContentDataSource.getAllContents();
      return ApiResult.success(data: response);
    }on DioException catch(e) {
      return ApiResult.failure(error: e.response?.data['message'].toString());
    }
  }
}

@lazySingleton
class PutContentRepository with GeneralRepository {
  final PutContentDataSource putContentDataSource;

  PutContentRepository({required this.putContentDataSource});

  Future<ApiResult> putContent({required ContentResponseEntity entity}) async {
    try {
      final response = await putContentDataSource.putContent(entity: entity);
      return ApiResult.success(data: response);
    }on DioException catch(e) {
      return ApiResult.failure(error: e.response?.data['message'].toString());
    }
  }
}