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
import 'package:flutter_application/features/auth/data/models/register_request_body.dart';
import 'package:flutter_application/features/auth/logic/cubit/auth_cubit.dart';
import 'package:flutter_application/features/auth/logic/cubit/auth_state.dart';
import 'package:flutter_application/features/auth/ui/login_screen.dart';
import 'package:flutter_application/features/auth/ui/widgets/signUp_text.dart';
import 'package:flutter_application/features/auth/ui/widgets/social_login.dart';
import 'package:flutter_application/features/auth/ui/widgets/terms_and_conditions_text.dart';
import 'package:flutter_application/features/auth/ui/widgets/title_and_text.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

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
                        child: CircularProgressIndicator(
                            color: AppColors.blueColor),
                      ),
                    );
                  },
                  loaded: (message) {
                    // Hide loading indicator
                    Navigator.of(context).pop();
                    // Show success message
                    context.pushNamed(Routes.login);
                  },
                  error: (errorMessage) {
                    // Hide loading indicator
                    Navigator.of(context).pop();
                    // Show error message
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(errorMessage)),
                    );
                  },
                );
              },
              child: Column(
                children: [
                  TitleAndText(
                    title: 'Create Account',
                    text:
                        'Sign up now and start exploring all that our app has to offer. We\'re excited to welcome you to our community!',
                  ),
                  heightSpace(32),
                  CustomTextFormField(
                    hintText: 'Name',
                    controller: _nameController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your name';
                      }
                      return null;
                    },
                  ),
                  heightSpace(16),
                  CustomTextFormField(
                    hintText: 'Phone',
                    keyboardType: TextInputType.phone,
                    controller: _phoneController,
                    validator: (value) {
                      if (value == null ||
                          value.isEmpty ||
                          !AppRegex.isPhoneNumberValid(value)) {
                        return 'Please enter a valid phone number';
                      }
                      return null;
                    },
                  ),
                  heightSpace(16),
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
                  CustomTextFormField(
                    hintText: 'Confirm Password',
                    controller: _confirmPasswordController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please confirm your password';
                      }
                      if (value != _passwordController.text) {
                        return 'Passwords do not match';
                      }
                      return null;
                    },
                    isObscure: true,
                  ),
                  heightSpace(32),
                  BlocBuilder<AuthCubit, AuthState>(
                    buildWhen: (previous, current) =>
                        current is AuthLoading ||
                        current is AuthError ||
                        current is AuthLoaded,
                    builder: (context, state) {
                      return CustomElevatedButton(
                        text: 'Register',
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            context.read<AuthCubit>().register(
                                  RegisterRequestBody(
                                    name: _nameController.text,
                                    phone: _phoneController.text,
                                    email: _emailController.text,
                                    password: _passwordController.text,
                                    confirmPassword:
                                        _confirmPasswordController.text,
                                    gender: 0,
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
                    title: "Already have an account? ",
                    text: 'Log In',
                    recognizer: TapGestureRecognizer()
                      ..onTap =
                          () => context.pushReplacementNamed(Routes.login),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    ));
  }
}
