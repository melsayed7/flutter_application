import 'package:dio/dio.dart';
import 'package:flutter_application/core/network/api_constants.dart';
import 'package:flutter_application/features/auth/data/models/login_request_body.dart';
import 'package:flutter_application/features/auth/data/models/login_response_body.dart';
import 'package:flutter_application/features/auth/data/models/register_request_body.dart';
import 'package:flutter_application/features/auth/data/models/register_response_body.dart';
import 'package:retrofit/retrofit.dart';

part 'api_services.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class ApiServices {
  factory ApiServices(Dio dio, {String baseUrl}) = _ApiServices;

  @POST(ApiConstants.loginEndpoint)
  Future<LoginResponseBody> login(
    @Body() LoginRequestBody loginRequestBody,
  );

  @POST(ApiConstants.registerEndpoint)
  Future<RegisterResponseBody> register(
    @Body() RegisterRequestBody registerRequestBody,
  );
}
