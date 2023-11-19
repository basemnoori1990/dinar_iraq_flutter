
import 'dart:ui';

import 'package:dinar_iraq/providers/base_provider.dart';
import 'package:get_it/get_it.dart';

import '../model/companies_model.dart';
import '../repos/companies_repository.dart';

class CompaniesProvider extends BaseProvider{
  final CompaniesRepository _homeRepository = GetIt.instance<CompaniesRepository>();

  ///companies
  ///
  CompaniesResponse? _companyModel;
  CompaniesResponse? get company => _companyModel;

  Future<CompaniesResponse?> getCompany({
    VoidCallback? onSuccess,
    required String token,
    Function(String error)? onFailure,
  }
  ) async {
    print("AAAA ${token}");
    CompaniesResponse? companiesResponse;
    try {
      companiesResponse =
      await _homeRepository.getCompany(
        token : token ,
      );
      if (companiesResponse.companies != null) {
        if (onSuccess != null) onSuccess();
      } else {
        if (onFailure != null) {
          onFailure("Error Happer, Try Again");
        }
       // notifyListeners();
      }
    } catch (e) {
      if (onFailure != null) onFailure("Error Happer, Try Again");
    }
   // notifyListeners();
    return companiesResponse;
  }

}