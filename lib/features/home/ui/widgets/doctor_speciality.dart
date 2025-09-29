import 'package:flutter/material.dart';
import 'package:flutter_application/core/helper/extensions.dart';

import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/styles.dart';

class DoctorSpeciality extends StatelessWidget {
  const DoctorSpeciality({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Column(
        children: [
          customAppBarDoctorSpeciality(context),
        ],
      )),
    );
  }

  Widget customAppBarDoctorSpeciality(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () => context.pop(),
          child: Container(
              width: 40,
              height: 40,
              padding: const EdgeInsets.only(left: 8),
              decoration: BoxDecoration(
                  color: AppColors.moreLighterGray,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(width: .2)),
              child: const Icon(
                Icons.arrow_back_ios,
              )),
        ),
        Text(
          'Doctor Speciality',
          style: AppStyles.font18DarkBlueSemiBold,
        ),

      ],
    );
  }
}
