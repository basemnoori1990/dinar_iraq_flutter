import 'package:dinar_iraq/model/login_model.dart';
import 'package:dinar_iraq/utilis/app_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import '../constants/enmus.dart';
import '../model/register_model.dart';
import '../repos/login_repository.dart';
import 'base_provider.dart';

class LoginProvider extends BaseProvider {
  final LoginRepository _loginRepository = GetIt.instance<LoginRepository>();

  LoginResponse? _userModel;
  LoginResponse? get user => _userModel;

  RegisterResponse? _useerModel;
  RegisterResponse? get useer => _useerModel;

  /// Function Section
  Future<LoginResponse?> userLogin({
    VoidCallback? onSuccess,
    required String mail,
    required String pass,
    Function(String error)? onFailure,
  }) async {
    LoginResponse? loginResponse;
    try {
      isLoading = true;
      loginResponse = await _loginRepository.login(
        email: mail,
        password: pass,
      );
      isLoading = false;
      if (loginResponse.token != null) {
        _userModel = loginResponse;

        ///Save user locally
         AppFunctions.saveUserInSharedPreferences(
             isFirstTime: true, saveUserInShared: true, LoginResponse: _userModel);
        if (onSuccess != null) onSuccess();
      } else {
        if (onFailure != null) {
          onFailure("Error Happer, Try Again");
        }
        notifyListeners();
      }
    } catch (e) {
      if (onFailure != null) onFailure("Error Happer, Try Again");
      isLoading = false;
    }
    return loginResponse;
  }

///register
  ///
    Future<RegisterResponse?> userRegister({
      VoidCallback? onSuccess,
      required String name,
      required String mail,
      required String pass,
      Function(String error)? onFailure,
    }) async {
      RegisterResponse? registerResponse;
      try {
        isLoading = true;
        registerResponse = await _loginRepository.register(
          name: name,
          email: mail,
          password: pass,
        );
        isLoading = false;
        if (registerResponse.token != null) {
          _useerModel = registerResponse;

          ///Save user locally
          if (onSuccess != null) onSuccess();
        } else {
          if (onFailure != null) {
            onFailure("Error Happer, Try Again");
          }
          notifyListeners();
        }
      } catch (e) {
        if (onFailure != null) onFailure("Error Happer, Try Again");
        isLoading = false;
      }
      return registerResponse;
    }

  Future<bool> clearData() async {
    setErrors(Inputs.password, null);
    setErrors(Inputs.email, null);
    return true;
  }
}
