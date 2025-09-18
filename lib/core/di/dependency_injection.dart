import 'package:dio/dio.dart';
import 'package:flutter_application/core/network/api_services.dart';
import 'package:flutter_application/core/network/dio_factory.dart';
import 'package:flutter_application/features/auth/data/repo/login_repo.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter_application/features/auth/logic/cubit/login_cubit.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
//dio & services
  Dio dio = DioFactory.getDio();
  getIt.registerLazySingleton<ApiServices>(() => ApiServices(dio));

//login
  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt()));
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt()));
}
