import 'package:dinar_iraq/utilis/shared_preferences_utils.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import '../model/login_model.dart';
import 'get_it_services.dart';
import 'package:phoenix_native/phoenix_native.dart';

class AppFunctions{
  static saveUserInSharedPreferences({
    LoginResponse? LoginResponse,
    /// used In Change Password
    required bool saveUserInShared,
    required bool isFirstTime,
  }) {
    if (LoginResponse != null) {
      if (isFirstTime) {
        GetIt.instance<SharedPreferencesUtils>().saveUser(LoginResponse);
      }
    }
  }
  static void unSaveUserInSharedPreferences() {
    GetIt.instance<SharedPreferencesUtils>().saveUser(null);
    PhoenixNative.restartApp();
  }
  static Future<void> configureDependencies() async {
    WidgetsFlutterBinding.ensureInitialized();
    await EasyLocalization.ensureInitialized();
    await GetItServices.onInitGetIt();
  }
}