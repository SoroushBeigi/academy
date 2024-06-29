
import 'package:academy/src/services/network/network.dart';
import 'package:injectable/injectable.dart';

import '../../../saved/domain/entity/content/response/content_response_entity.dart';



@LazySingleton()
class GetAllContentDataSource with ApiBase<List<ContentResponseEntity>> {
  final DioClient _dioClient = DioClient();

  Future<List<ContentResponseEntity>> getAllContents() async {
    final response = await makeGetRequest(
      _dioClient.dio.get(ApiConfig.getAllContent),
    );

    if (response.statusCode == 200) {
      List<ContentResponseEntity> contentsList = (response.data as List)
          .map((item) => ContentResponseEntity.fromJson(item))
          .toList();
      return contentsList;
    } else {
      throw Exception('Failed to load contents');
    }
  }

}