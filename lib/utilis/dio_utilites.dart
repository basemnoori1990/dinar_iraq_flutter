import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';

import 'dio_expetions.dart';
import 'dio_retry/options.dart';
import 'dio_retry/retry_interceptor.dart';

class DioUtils {
  final Dio _dio;
  static DioUtils? _instance;
  DioUtils._(this._dio);
  static DioUtils getInstance() {
    if (_instance == null) {
      Dio dio = Dio();
      RetryInterceptor retryInterceptor = RetryInterceptor(
          options: RetryOptions(
            retries: 5, // Number of retries before a failure
            retryInterval:
                const Duration(seconds: 1), // Interval between each retry
            retryEvaluator: (error) =>
                error.type != DioExceptionType.cancel &&
                error.type !=
                    DioExceptionType
                        .unknown, // Evaluating if a retry is necessary regarding the error. It is a good candidate for updating authentication token in case of a unauthorized error (be careful with concurrency though)
          ),
          dio: dio);
      dio.interceptors.add(retryInterceptor);

      _instance = DioUtils._(dio);
    }
    return _instance!;
  }

  Future<String> makePostRequest(
      String endPoint, Map<String, dynamic> postValues,
      {Map<String, dynamic>? headers}) async {
    FormData formData = FormData.fromMap(postValues);
    Response response;
    try {
      response = await _dio
          .post(
        endPoint,
        data: formData,
        options: Options(
          headers: headers ??
              {
                'Accept': 'application/json',
                'Content-Type': 'application/json',
              },
          responseType: ResponseType.json,
          validateStatus: (statusCode) {
            print(statusCode);
            if (statusCode == null) {
              return false;
            }
            if (statusCode == 422 || statusCode == 404) {
              return true;
            } else {
              return statusCode >= 200 && statusCode < 300;
            }
          },
        ),
      )
          .catchError((e) {
       // String errorMessage = DioExceptions.fromDioError(e).toString();
        log("Catch Error $e");
      });

      return jsonEncode(response.data);
    } catch (e) {
      return '';
    }
  }

  Future<String> getRequest(String endPoint,
      {Map<String, dynamic>? headers}) async {
    Response response;
    try {
      response = await _dio.get(
        endPoint,
        options: Options(
          headers: headers ??
              {
                'Accept': 'application/json',
                'Content-Type': 'application/json',
              },
          responseType: ResponseType.json,
          validateStatus: (statusCode) {
            if (statusCode == null) {
              return false;
            }
            if (statusCode == 422) {
              return true;
            } else {
              return statusCode >= 200 && statusCode < 300;
            }
          },
        ),
      );

      return jsonEncode(response.data);
    } catch (e) {
      return '';
    }
  }
}
