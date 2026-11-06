import 'package:flutter/material.dart';
import '../theming/app_colors.dart';

class AppTextFormField extends StatelessWidget {
  final EdgeInsetsGeometry? contentPadding;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final TextStyle? inputTextStyle;
  final TextStyle? hintStyle;
  final String hintText;
  final bool? isObscureText;
  final Widget? suffixIcon;
  final Color? backgroundColor;
  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;

  const AppTextFormField({
    super.key,
    this.contentPadding,
    this.focusedBorder,
    this.enabledBorder,
    this.inputTextStyle,
    this.hintStyle,
    required this.hintText,
    this.isObscureText,
    this.suffixIcon,
    this.backgroundColor,
    this.controller,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        isDense: true,
        contentPadding: contentPadding ??
            const EdgeInsets.symmetric(horizontal: 20.0, vertical: 18.0),
        focusedBorder: focusedBorder ??
            const OutlineInputBorder(
              borderSide: BorderSide(
                color: AppColors.primary,
                width: 1.3,
              ),
              borderRadius: BorderRadius.all(Radius.circular(16.0)),
            ),
        enabledBorder: enabledBorder ??
            const OutlineInputBorder(
              borderSide: BorderSide(
                color: AppColors.lighterGray,
                width: 1.3,
              ),
              borderRadius: BorderRadius.all(Radius.circular(16.0)),
            ),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.red,
            width: 1.3,
          ),
          borderRadius: BorderRadius.all(Radius.circular(16.0)),
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.red,
            width: 1.3,
          ),
          borderRadius: BorderRadius.all(Radius.circular(16.0)),
        ),
        hintStyle: hintStyle ?? const TextStyle(color: AppColors.gray),
        hintText: hintText,
        suffixIcon: suffixIcon,
        filled: true,
        fillColor: backgroundColor ?? AppColors.moreLightGray,
      ),
      obscureText: isObscureText ?? false,
      style: inputTextStyle ?? const TextStyle(color: AppColors.darkBlue),
      validator: validator,
    );
  }
}
