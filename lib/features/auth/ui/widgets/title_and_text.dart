import 'package:flutter/material.dart';
import 'package:flutter_application/core/theming/styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TitleAndText extends StatelessWidget {
  const TitleAndText({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Welcome Back',
          style: AppStyles.font32Blue700Weight,
        ),
        SizedBox(height: 8.h),
        Text(
          'We\'re excited to have you back, can\'t wait to see what you\'ve been up to since you last logged in.',
          style: AppStyles.font14Gray400Weight,
        ),
      ],
    );
  }
}
