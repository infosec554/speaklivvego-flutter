import 'package:flutter/material.dart';
import 'package:speak_live_go/core/constants/app_colors.dart';

ColorScheme get colorSchemeLight => const ColorScheme.light().copyWith(
  secondary: AppColors.cC1E2F3disableOrDivider,
  primary: AppColors.c2A85F3primary,
  error: AppColors.cF84A4Ared,
  onSecondary: AppColors.c7CA9DFonSecondary,
  outline: AppColors.c2A85F3primary,
  onPrimary: AppColors.white,
  onPrimaryContainer: AppColors.white,
  surfaceTint: AppColors.white,

  scrim: AppColors.cF84A4Ared,
);
