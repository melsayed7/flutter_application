import 'package:flutter/material.dart';
import 'package:flutter_application/core/theming/app_colors.dart';
import 'package:flutter_application/core/theming/app_images.dart';
import 'package:flutter_application/core/theming/styles.dart';
import 'package:flutter_svg/svg.dart';

class HomeTapBarWidget extends StatelessWidget {
  const HomeTapBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
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
        CircleAvatar(
            backgroundColor: AppColors.moreLighterGray,
            child: SvgPicture.asset(AppImages.notifications)),
      ],
    );
  }
}
