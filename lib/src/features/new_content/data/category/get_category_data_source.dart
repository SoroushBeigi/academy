import 'package:academy/src/features/new_content/domain/entity/category/response/category_response_entity.dart';
import 'package:academy/src/services/network/dio_config/dio_client.dart';
import 'package:academy/src/services/network/network.dart';
import 'package:injectable/injectable.dart';



@LazySingleton()
class GetCategoryDataSource with ApiBase<List<CategoryResponseEntity>> {
  final DioClient _dioClient = DioClient();

  Future<List<CategoryResponseEntity>> getCategory() async {
    final response = await makeGetRequest(
      _dioClient.dio.get(ApiConfig.category),
    );
    if (response.statusCode == 200) {
      List<CategoryResponseEntity> categoryList = (response.data as List)
          .map((item) => CategoryResponseEntity.fromJson(item as Map<String, dynamic>))
          .toList();
      return categoryList;
    } else {
      throw Exception('Failed to load category');
    }
  }

}