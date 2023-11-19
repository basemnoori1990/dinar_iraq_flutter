import 'package:dinar_iraq/repos/address_repository.dart';
import 'package:dinar_iraq/repos/cart_repository.dart';
import 'package:dinar_iraq/repos/categories_repository.dart';
import 'package:dinar_iraq/repos/companies_repository.dart';
import 'package:dinar_iraq/repos/products_repository.dart';
import 'package:dinar_iraq/utilis/shared_preferences_utils.dart';
import 'package:get_it/get_it.dart';
import '../repos/login_repository.dart';
import 'dio_utilites.dart';



class GetItServices {
  GetItServices._();
  static onInitGetIt() async {
    GetIt getIt = GetIt.instance;
    getIt.allowReassignment = true;
    getIt.registerSingleton<SharedPreferencesUtils>(
        await SharedPreferencesUtils.getInstance());
    getIt.registerSingleton<DioUtils>(DioUtils.getInstance());
    getIt.registerSingleton<LoginRepository>(LoginRepository.getInstance());
    getIt.registerSingleton<CompaniesRepository>(CompaniesRepository.getInstance());
    getIt.registerSingleton<CategoriesRepository>(CategoriesRepository.getInstance());
    getIt.registerSingleton<ProductsRepository>(ProductsRepository.getInstance());
    getIt.registerSingleton<CartRepository>(CartRepository.getInstance());
    getIt.registerSingleton<AddressRepository>(AddressRepository.getInstance());
  }
}
