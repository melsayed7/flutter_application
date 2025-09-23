import 'package:flutter/material.dart';
import 'package:flutter_application/core/helper/app_constant.dart';
import 'package:flutter_application/core/routing/app_route.dart';
import 'package:flutter_application/core/routing/routes.dart';
import 'package:flutter_application/core/theming/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DocApp extends StatelessWidget {
  AppRoute appRoute;
  DocApp({super.key, required this.appRoute});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        child: MaterialApp(
          theme: ThemeData(
            primaryColor: AppColors.blueColor,
            scaffoldBackgroundColor: Colors.white,
          ),
          debugShowCheckedModeBanner: false,
          //initialRoute: Routes.register,
          initialRoute: isLoggedInUser ? Routes.home : Routes.login,
          onGenerateRoute: AppRoute.generateRoute,
        ));
  }
}
