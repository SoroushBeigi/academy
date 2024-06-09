import 'package:dio/dio.dart';
import 'pretty_dio_logger.dart';

class DioClient {
  static final DioClient _instance = DioClient._internal();
  late final Dio dio;
  factory DioClient() => _instance;
  DioClient._internal() {
    dio = Dio(
        BaseOptions(
          responseType: ResponseType.json,
          connectTimeout: const Duration(seconds: 30),
          receiveTimeout: const Duration(seconds: 30),
        )
    )..interceptors.add(PrettyDioLogger());
  }
}