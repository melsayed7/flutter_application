import 'package:dio/dio.dart';
import 'package:flutter_application/core/network/api_services.dart';
import 'package:flutter_application/core/network/dio_factory.dart';
import 'package:flutter_application/features/auth/data/repo/auth_repo.dart';
import 'package:flutter_application/features/home/data/repo/home_repo.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter_application/features/auth/logic/cubit/auth_cubit.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
//dio & services
  Dio dio = DioFactory.getDio();
  getIt.registerLazySingleton<ApiServices>(() => ApiServices(dio));

//login + register
  getIt.registerLazySingleton<AuthRepo>(() => AuthRepo(getIt()));
  getIt.registerFactory<AuthCubit>(() => AuthCubit(getIt()));

//home
  getIt.registerLazySingleton<HomeRepo>(() => HomeRepo(getIt()));

}
