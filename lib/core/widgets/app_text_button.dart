import 'package:flutter/material.dart';

import '../theming/app_colors.dart';

class AppTextButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String buttonText;
  final TextStyle textStyle;
  final Color? backgroundColor;
  final double? borderRadius;
  final double? horizontalPadding;
  final double? verticalPadding;

  const AppTextButton({
    super.key,
    required this.onPressed,
    required this.buttonText,
    required this.textStyle,
    this.backgroundColor,
    this.borderRadius,
    this.horizontalPadding,
    this.verticalPadding,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(
          backgroundColor ?? AppColors.primary,
        ),
        padding: WidgetStateProperty.all(
          EdgeInsets.symmetric(
            horizontal: horizontalPadding ?? 12.0,
            vertical: verticalPadding ?? 14.0,
          ),
        ),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 16.0),
          ),
        ),
      ),
      onPressed: onPressed,
      child: Text(buttonText, style: textStyle),
    );
  }
}
