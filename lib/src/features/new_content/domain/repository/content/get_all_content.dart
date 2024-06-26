
import 'package:academy/src/services/network/network_state/api_result.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../../../services/network/network.dart';
import '../../../../favourite/domain/entity/content/response/content_response_entity.dart';
import '../../../data/content/get_all_content.dart';


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