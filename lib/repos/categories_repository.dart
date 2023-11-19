import 'dart:convert';
import 'package:dinar_iraq/repos/base_repository.dart';
import '../constants/apis.dart';
import '../model/categories_model.dart';

class CategoriesRepository extends BaseRepository {
  static CategoriesRepository? _instance;
  CategoriesRepository._();

  static CategoriesRepository getInstance() {
    _instance ??= CategoriesRepository._();
    return _instance!;
  }

  ///categoryRepo
  ///
  Future<CategoriesResponse> getCategory({required String token}) async {
    print("TTTTT $token");
    String result = await dio.getRequest(ApisDinar.categoriesENDPOINT, headers: {
      "Authorization": "Bearer $token",
    });
    return CategoriesResponse.fromJson(json.decode(result));
  }
}
