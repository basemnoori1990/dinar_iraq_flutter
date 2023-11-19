import 'dart:convert';
import 'package:dinar_iraq/model/companies_model.dart';
import 'package:dinar_iraq/repos/base_repository.dart';
import '../constants/apis.dart';

class CompaniesRepository extends BaseRepository {
  static CompaniesRepository? _instance;
  CompaniesRepository._();

  static CompaniesRepository getInstance() {
    _instance ??= CompaniesRepository._();
    return _instance!;
  }

  ///companyRepo
  ///
  Future<CompaniesResponse> getCompany({required String token}) async {
    print("TTTTT $token");
    String result = await dio.getRequest(ApisDinar.companiesENDPOINT, headers: {
      "Authorization": "Bearer $token",
    });
    return CompaniesResponse.fromJson(json.decode(result));
  }
}
