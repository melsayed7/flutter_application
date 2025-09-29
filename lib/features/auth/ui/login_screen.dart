import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application/core/helper/app_regex.dart';
import 'package:flutter_application/core/helper/extensions.dart';
import 'package:flutter_application/core/helper/spacing.dart';
import 'package:flutter_application/core/routing/routes.dart';
import 'package:flutter_application/core/theming/app_colors.dart';
import 'package:flutter_application/core/theming/styles.dart';
import 'package:flutter_application/core/widgets/custom_elevated_button.dart';
import 'package:flutter_application/core/widgets/custom_text_form_field.dart';
import 'package:flutter_application/features/auth/data/models/login_request_body.dart';
import 'package:flutter_application/features/auth/logic/cubit/auth_cubit.dart';
import 'package:flutter_application/features/auth/logic/cubit/auth_state.dart';
import 'package:flutter_application/features/auth/ui/widgets/remember_and_forgot_password.dart';
import 'package:flutter_application/features/auth/ui/widgets/signUp_text.dart';
import 'package:flutter_application/features/auth/ui/widgets/social_login.dart';
import 'package:flutter_application/features/auth/ui/widgets/terms_and_conditions_text.dart';
import 'package:flutter_application/features/auth/ui/widgets/title_and_text.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: BlocListener<AuthCubit, AuthState>(
            listenWhen: (previous, current) =>
                current is AuthLoaded ||
                current is AuthError ||
                current is AuthLoading,
            listener: (context, state) {
              state.when(
                initial: () {},
                loading: () {
                  // Show loading indicator
                  showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (context) => const Center(
                      child:
                          CircularProgressIndicator(color: AppColors.blueColor),
                    ),
                  );
                },
                loaded: (message) {
                  // Hide loading indicator
                  Navigator.of(context).pop();
                  // Show success message
                  context.pushNamed(Routes.layout);
                },
                error: (apiErrorModel) {
                  // Hide loading indicator
                  Navigator.of(context).pop();
                  // Show error message
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(apiErrorModel.getAllErrorMessages())),
                  );
                },
              );
            },
            child: Column(
              children: [
                TitleAndText(
                  title: 'Welcome Back',
                  text:
                      'We\'re excited to have you back, can\'t wait to see what you\'ve been up to since you last logged in.',
                ),
                heightSpace(32),
                CustomTextFormField(
                  hintText: 'Email',
                  keyboardType: TextInputType.emailAddress,
                  controller: _emailController,
                  validator: (value) {
                    if (value == null ||
                        value.isEmpty ||
                        !AppRegex.isEmailValid(value)) {
                      return 'Please enter a valid email';
                    }
                    return null;
                  },
                ),
                heightSpace(16),
                CustomTextFormField(
                  hintText: 'Password',
                  controller: _passwordController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    return null;
                  },
                  isObscure: true,
                ),
                heightSpace(16),
                const RememberAndForgotPassword(),
                heightSpace(32),
                BlocBuilder<AuthCubit, AuthState>(
                  buildWhen: (previous, current) =>
                      current is AuthLoaded ||
                      current is AuthError ||
                      current is AuthLoading,
                  builder: (context, state) {
                    return CustomElevatedButton(
                      text: 'Login',
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          context.read<AuthCubit>().login(
                                LoginRequestBody(
                                  email: _emailController.text,
                                  password: _passwordController.text,
                                ),
                              );
                        }
                      },
                    );
                  },
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
                SignUpText(
                  title: "Don't have an account? ",
                  text: 'Sign Up',
                  recognizer: TapGestureRecognizer()
                    ..onTap =
                        () => context.pushReplacementNamed(Routes.register),
                ),
              ],
            ),
          ),
        ),
      ),
    )));
  }
}
