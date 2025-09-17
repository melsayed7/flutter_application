import 'package:flutter/material.dart';
import 'package:flutter_application/core/theming/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppStyles {
  static TextStyle font24Black700Weight = TextStyle(
      fontSize: 24.sp, fontWeight: FontWeight.w700, color: Colors.black);

  static TextStyle font32Blue700Weight = TextStyle(
      fontSize: 32.sp, fontWeight: FontWeight.w700, color: AppColors.blueColor);

  static TextStyle font14Black400Weight = TextStyle(
      fontSize: 14.sp,
      fontWeight: FontWeight.w400,
      color: AppColors.darkGrayColor);

  static TextStyle font16White600Weight = TextStyle(
      fontSize: 16.sp,
      fontWeight: FontWeight.w600,
      color: AppColors.whiteColor);
}
