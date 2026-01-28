import 'package:flutter/material.dart';
import 'package:speak_live_go/core/constants/app_colors.dart';
import 'package:speak_live_go/utils/extensions/build_context/text_styles.dart';

class AppSecondaryButton extends StatelessWidget {
  const AppSecondaryButton({
    required this.title,
    super.key,
    this.onPressed,
    this.height = 60,
  });

  final VoidCallback? onPressed;
  final String title;
  final double height;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.cF2F3F3,
        foregroundColor: AppColors.black,
        minimumSize: Size(double.maxFinite, height),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(height / 4),
        ),
        elevation: 0,
      ),
      child: Text(
        title,
        style: context.cBlackColorTextStyle?.copyWith(
          fontWeight: FontWeight.w600,
          fontSize: 16,
        ),
      ),
    );
  }
}
