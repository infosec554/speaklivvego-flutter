import 'package:flutter/material.dart';
import 'package:speak_live_go/core/constants/app_colors.dart';

InputDecorationTheme get darkInputDecorationTheme {
  final inputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(20),
    borderSide: const BorderSide(color: AppColors.c2A85F3primary),
  );
  return InputDecorationTheme(

    hintStyle: const TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w600,
      color: AppColors.black,
    ),

    contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
    fillColor: AppColors.white,
    filled: true,
    border: inputBorder,
    focusedBorder: inputBorder,
    enabledBorder: inputBorder,
    disabledBorder: inputBorder,
  );
}
