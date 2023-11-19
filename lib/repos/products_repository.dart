import 'package:dinar_iraq/model/products_model.dart';

import '../constants/apis.dart';
import 'dart:convert';
import 'package:dinar_iraq/repos/base_repository.dart';
import '../model/categories_model.dart';

class ProductsRepository extends BaseRepository {
  static ProductsRepository? _instance;
  ProductsRepository._();

  static ProductsRepository getInstance() {
    _instance ??= ProductsRepository._();
    return _instance!;
  }


  Future<ProductsResponse> getProducts({required String token}) async {
    print("TTTTT $token");
    String result = await dio.getRequest(ApisDinar.productsENDPOINT, headers: {
      "Authorization": "Bearer $token",
    });
    return ProductsResponse.fromJson(json.decode(result));
  }
}