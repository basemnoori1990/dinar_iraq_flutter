import '../utilis/config.dart';

class ApisDinar{
  ApisDinar._();
  static const String root = DinarConfig.domainName;
  static const String baseApi = '$root/api/';
  static const String loginENDPOINT = "${baseApi}login";
  static const String registerENDPOINT = "${baseApi}register";
  static const String companiesENDPOINT = "${baseApi}companies";
  static const String categoriesENDPOINT = "${baseApi}categories";
  static const String productsENDPOINT = "${baseApi}products";
  static const String cartENDPOINT = "${baseApi}cart";
  static const String addressENDPOINT = "${baseApi}address";
}