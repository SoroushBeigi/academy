import 'package:dio/dio.dart';

import 'dio_config/dio_exceptions.dart';
import 'network_state/api_result.dart';

mixin GeneralRepository<T> {
  Future<ApiResult<T>> checkResponseFailOrSuccess (Future<T> apiCallback) async{
    try {
      final T items = await apiCallback;
      return ApiResult.success(data: items);
    } on DioException catch(e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      return ApiResult.failure(error: errorMessage);
    }
  }
}