
import 'package:academy/src/services/network/network_state/api_result.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../content_entity.dart';
import '../../../../../services/network/network.dart';
import '../../../data/content/get_all_content.dart';


@lazySingleton
class GetAllContentRepository with GeneralRepository<List<ContentEntity>> {
  final GetAllContentDataSource getAllContentDataSource;

  GetAllContentRepository({required this.getAllContentDataSource});

  Future<ApiResult<List<ContentEntity>>> getAllContent() async {
    try {
      final response = await getAllContentDataSource.getAllContents();
      return ApiResult.success(data: response);
    }on DioException catch(e) {
      return ApiResult.failure(error: e.response?.data['message'].toString());
    }
  }
}