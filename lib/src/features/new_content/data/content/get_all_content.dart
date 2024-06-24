
import 'package:academy/src/services/network/network.dart';
import 'package:injectable/injectable.dart';

import '../../../../../content_entity.dart';
import '../../../../services/network/dio_config/dio_client.dart';



@LazySingleton()
class GetAllContentDataSource with ApiBase<List<ContentEntity>> {
  final DioClient _dioClient = DioClient();

  Future<List<ContentEntity>> getAllContents() async {
    final response = await makeGetRequest(
      _dioClient.dio.get(ApiConfig.getAllContent),
    );

    if (response.statusCode == 200) {
      List<ContentEntity> contentsList = (response.data as List)
          .map((item) => ContentEntity.fromJson(item))
          .toList();
      return contentsList;
    } else {
      throw Exception('Failed to load contents');
    }
  }

}