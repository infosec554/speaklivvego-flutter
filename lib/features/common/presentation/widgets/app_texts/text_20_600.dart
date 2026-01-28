import 'package:flutter/material.dart';
import 'package:speak_live_go/core/constants/app_colors.dart';

class AppText20W600Black extends Text {
  const AppText20W600Black(
    super.data, {
    super.key,
    super.textAlign,
  }) : super(
         style: const TextStyle(
           fontWeight: FontWeight.w600,
           fontSize: 20,
           color: AppColors.black,
         ),
       );
}
