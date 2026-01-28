import 'package:flutter/material.dart';
import 'package:speak_live_go/core/constants/app_colors.dart';
import 'package:speak_live_go/core/constants/font_family_names.dart';

InputDecorationTheme get lightInputDecorationTheme {
  final inputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: const BorderSide(
      color: AppColors.cD5D7D9,
    ),
  );
  return InputDecorationTheme(
    hintStyle: const TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w400,
      color: AppColors.c8A8A8A,
      fontFamily: FFN.poppins,
    ),
    labelStyle: const TextStyle(
      color: AppColors.c8A8A8A,
      fontSize: 16,
      fontFamily: FFN.poppins,
      fontWeight: FontWeight.w600,
    ),
    contentPadding: const EdgeInsets.symmetric(vertical: 18, horizontal: 12),
    fillColor: AppColors.white,
    filled: true,
    border: inputBorder,
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(color: AppColors.c2A85F3primary),
    ),
    enabledBorder: inputBorder,
    disabledBorder: inputBorder,
  );
}
