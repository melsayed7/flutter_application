import 'package:flutter/material.dart';
import 'package:flutter_application/core/theming/styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TitleAndText extends StatelessWidget {
  final String title;
  final String text;
  TitleAndText({super.key, required this.title, required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppStyles.font32Blue700Weight,
        ),
        SizedBox(height: 8.h),
        Text(
          text,
          style: AppStyles.font14Gray400Weight,
        ),
      ],
    );
  }
}
