import 'package:flutter/material.dart';
import 'package:flutter_application/core/theming/styles.dart';

class SignUpText extends StatelessWidget {
  const SignUpText({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(
            text: "Already have an account? ",
            style: AppStyles.font13DarkBlueRegular,
          ),
          TextSpan(
            text: 'Sign Up',
            style: AppStyles.font13BlueSemiBold,
          ),
        ],
      ),
    );
  }
}
