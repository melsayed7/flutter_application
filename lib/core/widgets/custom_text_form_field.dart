import 'package:flutter/material.dart';
import 'package:flutter_application/core/theming/app_colors.dart';
import 'package:flutter_application/core/theming/styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextFormField extends StatefulWidget {
  final String hintText;
  final bool isObscure;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final TextInputType? keyboardType;

  CustomTextFormField({
    super.key,
    required this.hintText,
    this.validator,
    this.isObscure = false,
    this.controller,
    this.keyboardType,
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool isVisible = false;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      keyboardType: widget.keyboardType,
      decoration: InputDecoration(
        fillColor: AppColors.lightColor,
        filled: true,
        isDense: true,
        contentPadding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 18.h),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: AppColors.blueColor, width: 1.3),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide:
              const BorderSide(color: AppColors.lighterGrayColor, width: 1.3),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: Colors.red, width: 1.3),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: Colors.red, width: 1.3),
        ),
        hintText: widget.hintText,
        hintStyle: AppStyles.font14Gray400Weight.copyWith(
          color: AppColors.lightGrayColor,
        ),
        suffixIcon: widget.isObscure
            ? IconButton(
                onPressed: () {
                  setState(() {
                    isVisible = !isVisible;
                  });
                },
                icon: isVisible
                    ? const Icon(
                        Icons.visibility,
                        color: AppColors.lightGrayColor,
                      )
                    : const Icon(
                        Icons.visibility_off,
                        color: AppColors.lightGrayColor,
                      ),
              )
            : null,
      ),
      validator: widget.validator,
      obscureText: widget.isObscure ? !isVisible : false,
      cursorColor: AppColors.blueColor,
      style: AppStyles.font14DarkBlueMedium,
    );
  }
}
