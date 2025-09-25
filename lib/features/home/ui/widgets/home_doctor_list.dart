import 'package:flutter/material.dart';
import 'package:flutter_application/core/helper/spacing.dart';
import 'package:flutter_application/core/theming/styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeDoctorList extends StatelessWidget {
  const HomeDoctorList({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView.separated(
      itemCount: 8,
      separatorBuilder: (context, index) => heightSpace(16),
      itemBuilder: (context, index) => customDoctorList(),
    ));
  }

  Widget customDoctorList() {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12.0),
          child: Image.network(
            width: 110.w,
            height: 120.h,
            'https://static.wikia.nocookie.net/five-world-war/images/6/64/Hisoka.jpg/revision/latest?cb=20190313114050',
            fit: BoxFit.cover,
          ),
        ),
        widthSpace(16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Dr. Randy Wigham',
              style: AppStyles.font18DarkBlueSemiBold,
              overflow: TextOverflow.ellipsis,
            ),
            heightSpace(8),
            Row(
              children: [
                Text(
                  'General',
                  style: AppStyles.font12GrayMedium,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  '  |  ',
                  style: AppStyles.font12GrayMedium,
                ),
                Text(
                  'RSUD Gatot Subroto',
                  style: AppStyles.font12GrayMedium,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
            heightSpace(12),
            Row(
              children: [
                const Icon(
                  Icons.star,
                  color: Colors.amber,
                  size: 18,
                ),
                Text(
                  '4.8',
                  style: AppStyles.font12GrayMedium,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  ' (4,279 reviews)',
                  style: AppStyles.font12GrayMedium,
                ),
              ],
            ),
          ],
        )
      ],
    );
  }
}
