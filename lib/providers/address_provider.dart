import 'package:dinar_iraq/model/address_model.dart';
import 'package:dinar_iraq/repos/address_repository.dart';
import 'package:dinar_iraq/utilis/app_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'base_provider.dart';

class AddressProvider extends BaseProvider {
  final AddressRepository _addressRepository =
      GetIt.instance<AddressRepository>();

  AddressResponse? _addressModel;
  AddressResponse? get address => _addressModel;

  Future<AddressResponse?> addresss({
    VoidCallback? onSuccess,
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
    Function(String error)? onFailure,
    required String token,
  }) async {
    AddressResponse? addressResponse;
    try {
      isLoading = true;
      addressResponse = await _addressRepository.address(
        city: city,
        country: country,
        postcode: postcode,
        phone: phone,
        building: building,
        floor: floor,
        notes: notes,
        street:street,
        lat:lat,
        lng:lng,
        token: token
      );
      isLoading = false;
    //  if (addressResponse.address != null) {
        _addressModel = addressResponse;

        ///Save user locally
        AppFunctions.saveUserInSharedPreferences(
            isFirstTime: true,
            saveUserInShared: true,
            );
        if (onSuccess != null) onSuccess();
   //   } else {
        if (onFailure != null) {
          onFailure("Error Happer, Try Again");
        }
        notifyListeners();
    //  }
    } catch (e) {
      if (onFailure != null) onFailure("Error Happer, Try Again");
      isLoading = false;
    }
    return addressResponse;
  }
}
