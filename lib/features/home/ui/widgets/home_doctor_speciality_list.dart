import 'package:flutter/material.dart';
import 'package:flutter_application/core/helper/spacing.dart';
import 'package:flutter_application/core/theming/app_colors.dart';
import 'package:flutter_application/core/theming/app_images.dart';
import 'package:flutter_application/core/theming/styles.dart';
import 'package:flutter_application/features/home/data/model/specializations_response_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeDoctorSpecialityList extends StatelessWidget {
  final List<SpecializationsData> specializationsDataList ;
  const HomeDoctorSpecialityList({super.key, required this.specializationsDataList});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: specializationsDataList.length,
        itemBuilder: (context, index) => Padding(
          padding: EdgeInsetsDirectional.only(start: index == 0 ? 0 : 24.w),
          child: customDoctorWidget(specializationsDataList[index]),
        ),
      ),
    );
  }

  Widget customDoctorWidget(SpecializationsData specializationsDataItem) {
    return Column(
      children: [
        CircleAvatar(
          radius: 28.r,
          backgroundColor: AppColors.lightBlue,
          child: Image.asset(
            AppImages.doctorIcon,
            height: 50.h,
            width: 50.w,
          ),
        ),
        heightSpace(12.h),
        Text(
          specializationsDataItem.name,
          style: AppStyles.font12DarkBlueRegular,
        )
      ],
    );
  }
}
