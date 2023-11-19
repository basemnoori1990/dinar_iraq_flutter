import 'dart:convert';
import 'package:dinar_iraq/model/cart_model.dart';
import 'package:dinar_iraq/repos/base_repository.dart';
import '../constants/apis.dart';

class CartRepository extends BaseRepository {
  static CartRepository? _instance;
  CartRepository._();

  static CartRepository getInstance() {
    _instance ??= CartRepository._();
    return _instance!;
  }


  Future<CartResponse> getCart({required String token}) async {
    String result = await dio.getRequest(ApisDinar.cartENDPOINT, headers: {
      "Authorization": "Bearer $token",
    });
    return CartResponse.fromJson(json.decode(result));
  }
}