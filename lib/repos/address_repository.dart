import 'dart:convert';
import 'package:dinar_iraq/model/address_model.dart';
import 'package:dinar_iraq/repos/base_repository.dart';
import '../constants/apis.dart';

class AddressRepository extends BaseRepository {
  static AddressRepository? _instance;

  AddressRepository._();

  static AddressRepository getInstance() {
    _instance ??= AddressRepository._();
    return _instance!;
  }

  Future<AddressResponse> address({
    required String city,
    required String country,
    required String postcode,
    required String building,
    required String floor,
    required String notes,
    required String street,
    required String phone,
    required double lat,
    required double lng,
    required String token,

  }) async {
    Map<String, dynamic> body = {
      'user_id':1,
      'city': city,
      'country': country,
      'postcode': postcode,
      'building': building,
      'floor': floor,
      'notes': notes,
      'street': street,
      'phone': phone,
      'lat': lat.toString(),
      'lng': lng.toString(),
    };

    String result = await dio.makePostRequest(ApisDinar.addressENDPOINT, body,headers: {
      "Authorization":"Bearer $token",
      "Accept":"application/json"
    });
    print(result);
    print(ApisDinar.addressENDPOINT);
    print(body);
    return AddressResponse.fromJson(json.decode(result));
  }
}