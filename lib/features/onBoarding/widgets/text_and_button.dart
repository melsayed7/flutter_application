import 'package:flutter/material.dart';
import 'package:flutter_application/core/helper/extensions.dart';
import 'package:flutter_application/core/routing/routes.dart';
import 'package:flutter_application/core/theming/styles.dart';
import 'package:flutter_application/core/widgets/custom_elevated_button.dart';
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
            style: AppStyles.font14Gray400Weight,
          ),
          SizedBox(height: 32.h),
          CustomElevatedButton(
              text: 'Get Started',
              onPressed: () {
                context.pushReplacementNamed(Routes.login);
              }),
        ],
      ),
    );
  }
}
