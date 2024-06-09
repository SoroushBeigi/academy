import 'package:dio/dio.dart' show Response;
import 'package:academy/src/services/network/dio_config/dio_extensions.dart';
import 'dio_config/dio_exceptions.dart';


abstract mixin class ApiBase<T> {
  late final T data;

  Future<Response> _requestMethodTemplate(
      Future<Response<dynamic>> apiCallback) async {
    final Response response = await apiCallback;
    if (response.statusCode.success) {
      return response;
    } else {
      throw DioExceptions;
    }
  }

  //Generic method template for create item on server
  Future<Response> makePostRequest(
      Future<Response<dynamic>> apiCallback) async {
    return _requestMethodTemplate(apiCallback);
  }

  //Generic method template for update item on server
  Future<Response> makePutRequest(Future<Response<dynamic>> apiCallback) async {
    return _requestMethodTemplate(apiCallback);
  }

  //Generic method template for delete item from server
  Future<Response> makeDeleteRequest(
      Future<Response<dynamic>> apiCallback) async {
    return _requestMethodTemplate(apiCallback);
  }

  //Generic method template for getting data from Api
  Future<Response> makeGetRequest(Future<Response<dynamic>> apiCallback) async {
    return _requestMethodTemplate(apiCallback);
  }
}