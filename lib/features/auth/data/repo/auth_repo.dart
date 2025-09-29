import 'package:flutter_application/core/network/api_errorr_handler.dart';
import 'package:flutter_application/core/network/api_result.dart';
import 'package:flutter_application/core/network/api_services.dart';
import 'package:flutter_application/features/auth/data/models/login_request_body.dart';
import 'package:flutter_application/features/auth/data/models/login_response_body.dart';
import 'package:flutter_application/features/auth/data/models/register_request_body.dart';
import 'package:flutter_application/features/auth/data/models/register_response_body.dart';

class AuthRepo {
  final ApiServices _apiServices;

  AuthRepo(this._apiServices);

  Future<ApiResult<LoginResponseBody>> login(
      LoginRequestBody loginRequestBody) async {
    try {
      final result = await _apiServices.login(loginRequestBody);
      return ApiResult.success(result);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  Future<ApiResult<RegisterResponseBody>> register(
      RegisterRequestBody registerRequestBody) async {
    try {
      final result = await _apiServices.register(registerRequestBody);
      return ApiResult.success(result);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
