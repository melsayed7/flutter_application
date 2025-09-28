import 'package:flutter_application/core/network/api_errorr_handler.dart';
import 'package:flutter_application/core/network/api_result.dart';
import 'package:flutter_application/core/network/api_services.dart';
import 'package:flutter_application/features/home/data/model/specializations_response_model.dart';

class HomeRepo{
  final ApiServices _apiServices;
  HomeRepo(this._apiServices);

  Future<ApiResult<SpecializationsResponseModel>> getSpecializations() async {
    try {
      final result = await _apiServices.getSpecializationsIndex();
      return ApiResult.success(result);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}