import 'package:flutter/material.dart';
import 'package:flutter_application/core/di/dependency_injection.dart';
import 'package:flutter_application/core/helper/app_constant.dart';
import 'package:flutter_application/core/helper/shared_pref.dart';
import 'package:flutter_application/core/routing/app_route.dart';
import 'package:flutter_application/doc_app.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  setupGetIt();
  await ScreenUtil.ensureScreenSize();
  await checkIfLoggedInUser();
  runApp(DocApp(appRoute: AppRoute()));
}

checkIfLoggedInUser() async {

  String? userToken =
  await SharedPrefHelper.getSecuredString(SharedPrefKeys.userToken);
  if (!userToken!.isNotEmpty) {
    isLoggedInUser = true;
  } else {
    isLoggedInUser = false;
  }
}
