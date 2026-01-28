
import 'package:flutter/material.dart';
import 'package:speak_live_go/core/constants/app_colors.dart';
import 'package:speak_live_go/core/theme/theme_elements/text/light.dart';

final lightAppBarTheme = AppBarTheme(
  elevation: 0,
  toolbarHeight: 76,
  // shadowColor: colo,
  surfaceTintColor: AppColors.white,
  backgroundColor: Colors.white,
  titleTextStyle: lightTextTheme.titleLarge?.copyWith(
    fontWeight: FontWeight.w600,
    fontSize: 16,
  ),
);
