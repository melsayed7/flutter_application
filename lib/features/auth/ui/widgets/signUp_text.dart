import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application/core/helper/extensions.dart';
import 'package:flutter_application/core/routing/routes.dart';
import 'package:flutter_application/core/theming/styles.dart';

class SignUpText extends StatelessWidget {
  final String title;
  final String text;
  final GestureRecognizer recognizer;

  const SignUpText(
      {super.key,
      required this.title,
      required this.text,
      required this.recognizer});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(
            text: title,
            style: AppStyles.font13DarkBlueRegular,
          ),
          TextSpan(
            recognizer: recognizer,
            text: text,
            style: AppStyles.font13BlueSemiBold,
          ),
        ],
      ),
    );
  }
}
