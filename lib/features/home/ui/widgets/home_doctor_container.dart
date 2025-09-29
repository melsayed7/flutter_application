import 'package:flutter/material.dart';
import 'package:flutter_application/core/helper/spacing.dart';
import 'package:flutter_application/core/theming/app_images.dart';
import 'package:flutter_application/core/theming/styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeDoctorContainer extends StatelessWidget {
  const HomeDoctorContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 190.h,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            width: double.infinity,
            height: 165.h,
            padding: EdgeInsets.only(
              left: 18.w,
              top: 12.h,
            ),
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AppImages.backgroundHome),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Book and\nschedule with\nnearest doctor',
                  style: AppStyles.font18WhiteMedium,
                ),
                heightSpace(15.h),
                ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                    ),
                    child: Text(
                      'Find Nearby',
                      style: AppStyles.font12BlueRegular,
                    )),
              ],
            ),
          ),
          Positioned(
            right: 8.w,
            top: 0,
            child: Image.asset(
              AppImages.doctorHome,
              height: 200.h,
            ),
          )
        ],
      ),
    );
  }
}
