import 'package:flutter/material.dart';
import 'package:flutter_application/core/helper/app_regex.dart';
import 'package:flutter_application/core/helper/spacing.dart';
import 'package:flutter_application/core/widgets/custom_elevated_button.dart';
import 'package:flutter_application/core/widgets/custom_text_form_field.dart';
import 'package:flutter_application/features/auth/ui/widgets/title_and_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
          child: Column(
            children: [
              TitleAndText(
                title: 'Forgot Password',
                text:
                    'At our app, we take the security of your information seriously.',
              ),
              heightSpace(32),
              CustomTextFormField(
                hintText: 'Email',
                keyboardType: TextInputType.emailAddress,
                // controller: _emailController,
                validator: (value) {
                  if (value == null ||
                      value.isEmpty ||
                      !AppRegex.isEmailValid(value)) {
                    return 'Please enter a valid email';
                  }
                  return null;
                },
              ),
              const Spacer(),
              CustomElevatedButton(
                text: 'Reset Password',
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
