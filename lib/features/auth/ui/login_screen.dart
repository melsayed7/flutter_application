import 'package:flutter/material.dart';
import 'package:flutter_application/core/helper/spacing.dart';
import 'package:flutter_application/core/theming/app_colors.dart';
import 'package:flutter_application/core/theming/styles.dart';
import 'package:flutter_application/core/widgets/custom_elevated_button.dart';
import 'package:flutter_application/core/widgets/custom_text_form_field.dart';
import 'package:flutter_application/features/auth/ui/widgets/remember_and_forgot_password.dart';
import 'package:flutter_application/features/auth/ui/widgets/signUp_text.dart';
import 'package:flutter_application/features/auth/ui/widgets/social_login.dart';
import 'package:flutter_application/features/auth/ui/widgets/terms_and_conditions_text.dart';
import 'package:flutter_application/features/auth/ui/widgets/title_and_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const TitleAndText(),
              heightSpace(32),
              CustomTextFormField(
                hintText: 'Email',
                validator: (p0) {
                  if (p0 == null || p0.isEmpty) {
                    return 'Please enter your email';
                  }
                  return null;
                },
              ),
              heightSpace(16),
              CustomTextFormField(
                hintText: 'Password',
                validator: (p0) {
                  if (p0 == null || p0.isEmpty) {
                    return 'Please enter your password';
                  }
                  return null;
                },
                isObscure: true,
              ),
              heightSpace(16),
              const RememberAndForgotPassword(),
              heightSpace(32),
              CustomElevatedButton(
                text: 'Login',
                onPressed: () {},
              ),
              heightSpace(46),
              Row(
                children: [
                  const Expanded(
                    child: Divider(
                      color: Color(0xffE0E0E0),
                      thickness: 1,
                    ),
                  ),
                  Text(
                    ' or sign in with ',
                    style: AppStyles.font13GrayRegular,
                  ),
                  const Expanded(
                    child: Divider(
                      color: Color(0xffE0E0E0),
                      thickness: 1,
                    ),
                  ),
                ],
              ),
              heightSpace(32),
              const SocialLogin(),
              heightSpace(32),
              const TermsAndConditionsText(),
              heightSpace(24),
              const SignUpText(),
            ],
          ),
        ),
      ),
    )));
  }
}
