import 'package:flutter/material.dart';
import 'package:speak_live_go/core/constants/app_colors.dart';
import 'package:speak_live_go/utils/extensions/build_context/text_styles.dart';

class AppDangerButton extends StatelessWidget {
  const AppDangerButton({required this.title, super.key, this.onPressed});

  final VoidCallback? onPressed;
  final String title;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.cF63D4Dred,
        foregroundColor: AppColors.white,
        minimumSize: const Size(double.maxFinite, 42),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(9),
        ),
        elevation: 0,
      ),
      child: Text(
        title,

      ),
    );
  }
}
