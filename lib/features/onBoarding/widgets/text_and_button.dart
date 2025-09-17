import 'package:flutter/material.dart';
import 'package:flutter_application/core/helper/extensions.dart';
import 'package:flutter_application/core/routing/routes.dart';
import 'package:flutter_application/core/theming/styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/theming/app_colors.dart';

class TextAndButton extends StatelessWidget {
  const TextAndButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.w),
      child: Column(
        children: [
          Text(
            'Manage and schedule all of your medical appointments easily with Docdoc to get a new experience.',
            textAlign: TextAlign.center,
            style: AppStyles.font14Black400Weight,
          ),
          SizedBox(height: 32.h),
          ElevatedButton(
            onPressed: () {
              context.pushNamed(Routes.login);
            },
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 12.h),
              backgroundColor: AppColors.blueColor,
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              minimumSize: Size(double.infinity, 48.h),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.r),
              ),
            ),
            child: Text(
              'Get Started',
              style: AppStyles.font16White600Weight,
            ),
          ),
        ],
      ),
    );
  }
}
