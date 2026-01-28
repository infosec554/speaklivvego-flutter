import 'package:flutter/material.dart';
import 'package:speak_live_go/core/constants/app_colors.dart';
import 'package:speak_live_go/utils/extensions/string_extensions.dart';
import 'package:speak_live_go/features/common/presentation/widgets/buttons/app_tap.dart';

class AppIconButton extends StatelessWidget {
  const AppIconButton({
    required this.icon,
    super.key,
    this.onTap,
    this.bgColor,
  });

  final VoidCallback? onTap;
  final String icon;
  final Color? bgColor;

  @override
  Widget build(BuildContext context) {
    return AppTap(
      onTap: onTap,
      child: Container(
        height: 45,
        width: 45,
        decoration: BoxDecoration(
          color: bgColor ?? AppColors.c2A85F3primary,
          borderRadius: BorderRadius.circular(12),
        ),
        alignment: Alignment.center,
        child: icon.toSvgAsset(),
      ),
    );
  }
}
