
import 'dart:ui';
import 'package:dinar_iraq/model/cart_model.dart';
import 'package:dinar_iraq/providers/base_provider.dart';
import 'package:dinar_iraq/repos/cart_repository.dart';
import 'package:get_it/get_it.dart';


class CartProvider extends BaseProvider{
  final CartRepository _homeRepository = GetIt.instance<CartRepository>();


  CartResponse? _cartModel;
  CartResponse? get cart => _cartModel;

  Future<CartResponse?> getCart({
    VoidCallback? onSuccess,
    required String token,
    Function(String error)? onFailure,
  }
      ) async {
    CartResponse? cartResponse;
    try {
      cartResponse =
      await _homeRepository.getCart(
        token : token ,
      );
      if (cartResponse.cart != null) {
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
    return cartResponse;
  }

}