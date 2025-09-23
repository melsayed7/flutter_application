import 'package:flutter/material.dart';
import 'package:flutter_application/core/helper/spacing.dart';
import 'package:flutter_application/core/theming/app_images.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SocialLogin extends StatelessWidget {
  const SocialLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(AppImages.googleLogo, height: 46.h, width: 46.w),
        widthSpace(32),
        SvgPicture.asset(AppImages.facebookLogo, height: 46.h, width: 46.w),
        widthSpace(32),
        SvgPicture.asset(AppImages.appleLogo, height: 46.h, width: 46.w),
      ],
    );
  }
}
