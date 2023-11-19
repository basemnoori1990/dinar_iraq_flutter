import 'dart:convert';

import 'package:dinar_iraq/utilis/shared_preferences_utils.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import '../constants/apis.dart';
import '../model/all_address_model.dart';
import '../model/login_model.dart';
import '../repos/base_repository.dart';

class UserProvider extends ChangeNotifier with BaseRepository {
  LoginResponse? _userModel;
  LoginResponse? get user => _userModel;
  Address? _myAddress;
  Address? get myAddress => _myAddress;
  List<Address>? _allMyAddress;
  List<Address>? get allMyAddress => _allMyAddress;
  ///
  UserProvider() {
    setUser();
  }

  ///
  Future<LoginResponse?> setUser() async {
    _userModel = GetIt.instance<SharedPreferencesUtils>().getSavedUser();
    String result = await dio.getRequest(ApisDinar.addressENDPOINT,headers: {
      "Authorization":"Bearer ${_userModel!.token}"
    });
    _allMyAddress = AllMyAddress.fromJson(json.decode(result)).address;
    if (_allMyAddress!.isNotEmpty) {
      changeMyAddress(_allMyAddress!.first);
    }
    return _userModel;
  }

  changeMyAddress(Address newValue) {
    _myAddress = newValue;
    notifyListeners();
  }
}
