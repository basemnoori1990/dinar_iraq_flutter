import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/login_model.dart';


class SharedPreferencesUtils {
  final SharedPreferences _prefs;
  static SharedPreferencesUtils? _instance;
  static const String kUserSaved = 'user_saved_key';
  SharedPreferencesUtils._(this._prefs);
  static Future<SharedPreferencesUtils> getInstance() async {
    _instance ??= SharedPreferencesUtils._(
      await SharedPreferences.getInstance(),
    );
    return _instance!;
  }

  void saveUser(LoginResponse? LoginResponse) {
    if (LoginResponse == null) {
      _prefs.remove(kUserSaved);
    } else {
      Map<String, dynamic> userData = LoginResponse.toJson();
      String userEncoded = jsonEncode(userData);
      _prefs.setString(kUserSaved, userEncoded);
    }
  }

  LoginResponse? getSavedUser() {
    LoginResponse? result;
    String? savedUser = _prefs.getString(kUserSaved);
    if (savedUser != null) {
      Map<String, dynamic> userMap = jsonDecode(savedUser);
      result = LoginResponse.fromJson(userMap);
    }
    return result;
  }
}
