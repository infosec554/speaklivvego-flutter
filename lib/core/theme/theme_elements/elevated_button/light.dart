
import 'package:flutter/material.dart';
import 'package:speak_live_go/core/constants/app_colors.dart';

final lightElevatedButtonThemeData = ElevatedButtonThemeData(
  style: ElevatedButton.styleFrom(
    padding: const EdgeInsets.all(8),
    textStyle: const TextStyle(fontSize: 20,fontWeight: FontWeight.w700),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    backgroundColor: AppColors.c2A85F3primary,
    disabledBackgroundColor: AppColors.cC1E2F3disableOrDivider,
    disabledForegroundColor: AppColors.c7CA9DFonSecondary,
    foregroundColor: AppColors.white,
  ),
);
