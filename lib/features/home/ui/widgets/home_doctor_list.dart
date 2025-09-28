import 'package:flutter/material.dart';
import 'package:flutter_application/core/helper/spacing.dart';
import 'package:flutter_application/core/theming/styles.dart';
import 'package:flutter_application/features/home/data/model/specializations_response_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeDoctorList extends StatelessWidget {
  final List<DoctorsModel> doctorModel;

  const HomeDoctorList({super.key, required this.doctorModel});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView.separated(
      itemCount: doctorModel.length,
      separatorBuilder: (context, index) => heightSpace(16),
      itemBuilder: (context, index) => customDoctorList(doctorModel[index]),
    ));
  }

  Widget customDoctorList(DoctorsModel doctorItem) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12.0),
          child: Image.network(
            width: 110.w,
            height: 120.h,
            'https://img.freepik.com/premium-photo/3d-animation-style-white-background-doctor_911201-11196.jpg',
            fit: BoxFit.cover,
          ),
        ),
        widthSpace(16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              doctorItem.name,
              style: AppStyles.font18DarkBlueSemiBold,
              overflow: TextOverflow.ellipsis,
            ),
            heightSpace(8),
            Text(
              '${doctorItem.degree} | ${doctorItem.phone}',
              style: AppStyles.font12GrayMedium,
              overflow: TextOverflow.ellipsis,
            ),
            heightSpace(12),
            Text(
              doctorItem.email,
              style: AppStyles.font12GrayMedium,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        )
      ],
    );
  }
}
