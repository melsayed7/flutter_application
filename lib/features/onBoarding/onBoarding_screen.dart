import 'package:flutter/material.dart';
import 'package:flutter_application/features/onBoarding/widgets/doctor_image_and_text.dart';
import 'package:flutter_application/features/onBoarding/widgets/logo_and_title.dart';
import 'package:flutter_application/features/onBoarding/widgets/text_and_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Padding(
      padding: EdgeInsets.only(top: 22.h, bottom: 41.h),
      child: Column(
        children: [
          const LogoAndTitle(),
          SizedBox(height: 20.h),
          const DoctorImageAndText(),
          SizedBox(height: 18.h),
          const TextAndButton(),
        ],
      ),
    )));
  }
}
