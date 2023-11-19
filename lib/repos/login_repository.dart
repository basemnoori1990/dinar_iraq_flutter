
import 'dart:convert';
import 'package:dinar_iraq/model/login_model.dart';
import 'package:dinar_iraq/repos/base_repository.dart';
import '../constants/apis.dart';
import '../model/register_model.dart';

class LoginRepository extends BaseRepository{
  static LoginRepository? _instance;
  LoginRepository._();
  static LoginRepository getInstance() {
    _instance ??= LoginRepository._();
    return _instance!;
  }
  ///login
  ///
  Future<LoginResponse> login({
  required String email ,
  required String password ,
  }) async {

    Map<String, dynamic> body = {
      'email' : email ,
      'password' : password ,
    };

    String result = await dio.makePostRequest(ApisDinar.loginENDPOINT,body);
    return LoginResponse.fromJson(json.decode(result));
  }
  ///register
  ///
  Future<RegisterResponse> register({
    required String name ,
    required String email ,
    required String password ,
  }) async {

    Map<String, dynamic> body = {
      'name' : name ,
      'email' : email ,
      'password' : password ,
      'phone':"111111111111"
    };

    String result = await dio.makePostRequest(ApisDinar.registerENDPOINT,body);
    return RegisterResponse.fromJson(json.decode(result));
  }
}