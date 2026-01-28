import 'package:flutter/material.dart';
import 'package:speak_live_go/core/constants/app_colors.dart';

class AppShadows {
  const AppShadows._();

  static const userCard = [
    BoxShadow(
      color: AppColors.c7281DFWith8,
      blurRadius: 12,
      offset: Offset(
        0,
        3.84,
      ),
    ),
    BoxShadow(
      color: AppColors.c7281DFWith12,
      blurRadius: 50,
      offset: Offset(
        0,
        17,
      ),
    ),
  ];
  static List<BoxShadow> chatTextField = [
    BoxShadow(
      color: AppColors.black.withOpacity(.25),
      blurRadius: 20,
      offset: const Offset(
        0,
        4,
      ),
    ),
  ];
}
