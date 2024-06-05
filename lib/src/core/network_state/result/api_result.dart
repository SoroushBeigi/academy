import 'package:freezed_annotation/freezed_annotation.dart';

import '../error/network_exceptions.dart';

part 'api_result.freezed.dart';

@freezed
abstract class ApiResult<T> with _$ApiResult<T> {
  const factory ApiResult.success(
      {required T data, List<String>? failures, int? resultCode}) = Success<T>;

  const factory ApiResult.successWithPages(
      {required T data, List<String>? failures, int? resultCode}) = SuccessWithPages<T>;

  const factory ApiResult.failure(
      {required NetworkExceptions error, String? failures}) = Failure<T>;

}
