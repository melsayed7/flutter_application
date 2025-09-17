import 'package:flutter/material.dart';
import 'package:flutter_application/core/theming/app_colors.dart';
import 'package:flutter_application/core/theming/styles.dart';

class RememberAndForgotPassword extends StatelessWidget {
  const RememberAndForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Checkbox(
              value: true,
              onChanged: (value) {},
              activeColor: AppColors.grayColor,
              focusColor: AppColors.grayColor,
              checkColor: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4)),
            ),
            Text('Remember me', style: AppStyles.font13GrayRegular),
          ],
        ),
        TextButton(
          onPressed: () {},
          child: Text('Forgot Password?', style: AppStyles.font13BlueRegular),
        ),
      ],
    );
  }
}
