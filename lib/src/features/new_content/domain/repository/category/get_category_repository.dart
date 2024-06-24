import 'package:academy/src/features/new_content/data/category/get_category_data_source.dart';
import 'package:academy/src/features/new_content/domain/entity/category/response/category_response_entity.dart';
import 'package:academy/src/services/network/network.dart';
import 'package:academy/src/services/network/network_state/api_result.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';


@lazySingleton
class GetCategoryRepository with GeneralRepository<List<CategoryResponseEntity>> {
  final GetCategoryDataSource getCategoryDataSource;

  GetCategoryRepository({required this.getCategoryDataSource});

  Future<ApiResult<List<CategoryResponseEntity>>> getCategory() async {
    try {
      final response = await getCategoryDataSource.getCategory();
      return ApiResult.success(data: response);
    }on DioException catch(e) {
      return ApiResult.failure(error: e.response?.data['message'].toString());
    }
  }
}