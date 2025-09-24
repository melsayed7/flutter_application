import 'package:flutter/material.dart';
import 'package:flutter_application/core/theming/app_images.dart';
import 'package:flutter_application/core/theming/styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Hi Mohamed ",
                      style: AppStyles.font18DarkBlueSemiBold,
                    ),
                    Text(
                      "How Are you Today?",
                      style: AppStyles.font12GrayRegular,
                    ),
                  ],
                ),
                SvgPicture.asset(AppImages.googleLogo),
              ],
            ),
          ],
        ),
      )),
    );
  }
}
