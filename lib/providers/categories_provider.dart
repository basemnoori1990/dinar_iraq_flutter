
import 'dart:ui';

import 'package:dinar_iraq/providers/base_provider.dart';
import 'package:get_it/get_it.dart';

import '../model/categories_model.dart';
import '../model/companies_model.dart';
import '../repos/categories_repository.dart';
import '../repos/companies_repository.dart';

class CategoriesProvider extends BaseProvider{
  final CategoriesRepository _homeRepository = GetIt.instance<CategoriesRepository>();

  ///categories
  ///
  CategoriesResponse? _categoyModel;
  CategoriesResponse? get category => _categoyModel;

  Future<CategoriesResponse?> getCategory({
    VoidCallback? onSuccess,
    required String token,
    Function(String error)? onFailure,
  }
      ) async {
    print("AAAA ${token}");
    CategoriesResponse? categoriesResponse;
    try {
      categoriesResponse =
      await _homeRepository.getCategory(
        token : token ,
      );
      if (categoriesResponse.categories != null) {
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
    return categoriesResponse;
  }

}