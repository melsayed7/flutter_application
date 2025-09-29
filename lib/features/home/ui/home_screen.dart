import 'package:flutter/material.dart';
import 'package:flutter_application/core/helper/spacing.dart';
import 'package:flutter_application/core/theming/styles.dart';
import 'package:flutter_application/features/home/ui/widgets/doctor/doctors_bloc_builder.dart';
import 'package:flutter_application/features/home/ui/widgets/home_doctor_container.dart';
import 'package:flutter_application/features/home/ui/widgets/home_tap_bar.dart';
import 'package:flutter_application/features/home/ui/widgets/specialization/speciality_bloc_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
          child: Column(
            children: [
              const HomeTapBarWidget(),
              heightSpace(16.h),
              const HomeDoctorContainer(),
              heightSpace(24.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Doctor Speciality',
                    style: AppStyles.font18DarkBlueSemiBold,
                  ),
                  Text(
                    'See All',
                    style: AppStyles.font12BlueRegular,
                  ),
                ],
              ),
              heightSpace(16.h),
              const SpecialityBlocBuilder(),
              heightSpace(8),
              const DoctorsBlocBuilder(),
            ],
          ),
        ),
      ),
    );
  }
}
