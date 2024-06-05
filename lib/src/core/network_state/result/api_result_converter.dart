import 'package:academy/src/core/network_state/base_response.dart';
import 'package:academy/src/core/network_state/error/network_exceptions.dart';
import 'package:academy/src/core/network_state/result/api_result.dart';

extension ErrorApiResultExtension on Object {
  ApiResult<T> toApiResult<T>(StackTrace? stackTrace) {
    final error = NetworkExceptions.getDioException(this, stackTrace);
    final str = NetworkExceptions.getErrorMessage(error);
    return ApiResult.failure(error: error, failures: str);
  }
}

extension SuccessApiResultExtension on BaseSingleResponse {
  ApiResult<T> toApiResult<T>() {
    if (resultCode == 4) {
      var apiResult = ApiResult<T>.success(
        data: data,
        failures: ["بروز خطا در سیستم"],
      );
      return apiResult;
    }
    else if(resultCode == 3){
      var apiResult = ApiResult<T>.success(
        data: data,
        failures: ["کاربر مجوز استفاده از سرویس ندارد"],
      );
      //TODO: implement restart app package if needed
      // Restart.restartApp();
      return apiResult;
    }
    else {
      var apiResult = ApiResult<T>.success(data: data, failures: failures, resultCode: resultCode);
      return apiResult;
    }

    // var apiResult = ApiResult<T>.success(
    //     data: data, failures: failures, resultCode: resultCode);
    // return apiResult;
  }
}

