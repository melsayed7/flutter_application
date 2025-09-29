import 'package:flutter/material.dart';
import 'package:flutter_application/core/helper/extensions.dart';
import 'package:flutter_application/core/helper/spacing.dart';
import 'package:flutter_application/core/theming/app_colors.dart';
import 'package:flutter_application/core/theming/app_images.dart';
import 'package:flutter_application/core/theming/styles.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NotificationWidget extends StatelessWidget {
  const NotificationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            customAppBarNotification(context),
            heightSpace(32),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Today',
                  style: AppStyles.font12GrayMedium,
                ),
                Text(
                  'Mark all as read',
                  style: AppStyles.font12BlueRegular,
                ),
              ],
            ),
            heightSpace(12),
            customNotificationItem(),
            customNotificationItem(),
            Text(
              'Yesterday',
              style: AppStyles.font12GrayMedium,
            ),
            customNotificationItem(),
            customNotificationItem(),
          ],
        ),
      )),
    );
  }

  Widget customAppBarNotification(BuildContext context) {
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
          'Notification',
          style: AppStyles.font18DarkBlueSemiBold,
        ),
        Container(
          width: 70,
          height: 35,
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
              color: AppColors.blueColor,
              borderRadius: BorderRadius.circular(24)),
          child: Text(
            '2 NEW',
            textAlign: TextAlign.center,
            style: AppStyles.font12WhiteRegular,
          ),
        ),
      ],
    );
  }

  Widget customNotificationItem() {
    return Container(
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.only(top: 8 , bottom: 8),
      decoration: BoxDecoration(
          color: AppColors.lighterGray,
          borderRadius: BorderRadius.circular(12)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundColor: AppColors.lightGrayColor,
            child: SvgPicture.asset(AppImages.calendarIcon),
          ),
          widthSpace(12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Appointment Success ',
                  style: AppStyles.font14DarkBlueSemiBold,
                ),
                Text(
                  'Congratulations - your appointment is confirmed! We\'re looking forward to meeting with you and helping you achieve your goals.',
                  style: AppStyles.font12GrayRegular,
                ),
              ],
            ),
          ),
          widthSpace(7),
          Text(
            '1h',
            style: AppStyles.font12GrayRegular,
          ),
        ],
      ),
    );
  }
}
