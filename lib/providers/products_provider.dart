import 'dart:ui';

import 'package:dinar_iraq/providers/base_provider.dart';
import 'package:get_it/get_it.dart';

import '../model/companies_model.dart';
import '../model/products_model.dart';
import '../repos/companies_repository.dart';
import '../repos/products_repository.dart';

class ProductsProvider extends BaseProvider{
  final ProductsRepository _homeRepository = GetIt.instance<ProductsRepository>();

  ///companies
  ///
  ProductsResponse? _companyModel;
  ProductsResponse? get products => _companyModel;

  Future<ProductsResponse?> getProducts({
    VoidCallback? onSuccess,
    required String token,
    Function(String error)? onFailure,
  }
      ) async {
    print("AAAA ${token}");
    ProductsResponse? productsResponse;
    try {
      productsResponse =
      await _homeRepository.getProducts(
        token : token ,
      );
      if (productsResponse.products != null) {
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
    return productsResponse;
  }

}