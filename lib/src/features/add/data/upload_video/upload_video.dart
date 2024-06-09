import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:academy/src/services/network/network.dart';
import 'package:academy/src/services/network/dio_config/dio_client.dart';

@LazySingleton()
class UploadDataSource with ApiBase {
  final DioClient _dioClient = DioClient();

  Future uploadContent(FormData formData, Function(int, int) onSendProgress) async {
    final response = await makeGetRequest(
      _dioClient.dio.post(
          ApiConfig.uploadVideo,
          data: formData,
        onSendProgress: onSendProgress,
      ),
    );
    return response.data;
  }
}