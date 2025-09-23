import 'package:dio/dio.dart';
import 'package:flutter_application/core/helper/app_constant.dart';
import 'package:flutter_application/core/helper/shared_pref.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioFactory {
  DioFactory._();

  static Dio? dio;

  static Dio getDio() {
    Duration timeoutDuration = const Duration(seconds: 30);
    if (dio == null) {
      dio = Dio();
      dio!
        ..options.connectTimeout = timeoutDuration
        ..options.receiveTimeout = timeoutDuration
        ..options.sendTimeout = timeoutDuration;
      addDioHeaders();
      addDioInterceptors();
      return dio!;
    } else {
      return dio!;
    }
  }

  static void addDioHeaders() async {
    dio?.options.headers = {
      'Accept': 'application/json',
      'Authorization':
      'Bearer ${await SharedPrefHelper.getSecuredString(SharedPrefKeys.userToken)}',
    };
  }

  static void addDioInterceptors() {
    dio?.interceptors.add(
      PrettyDioLogger(
        //request: true,
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        // error: true,
        // compact: true,
      ),
    );
  }

  static void setTokenIntoHeaderAfterLogin(String token) {
    dio?.options.headers = {
      'Authorization': 'Bearer $token',
    };
  }


}
