import 'package:flutter/material.dart';
import 'package:speak_live_go/core/constants/app_colors.dart';
import 'package:speak_live_go/features/common/presentation/widgets/buttons/app_tap.dart';

class AppActivityContainer extends StatelessWidget {
  const AppActivityContainer({
    required this.child,
    required this.active,
    super.key,
    this.onTap,
    this.height,
    this.width,
    this.alignment,
    this.activeBgColor,
    this.padding = const EdgeInsets.all(20),
  });

  final Widget child;
  final Alignment? alignment;
  final VoidCallback? onTap;
  final bool active;
  final double? height;
  final double? width;
  final EdgeInsets? padding;
  final Color? activeBgColor;

  @override
  Widget build(BuildContext context) {
    return AppTap(
      onTap: onTap,
      child: AnimatedContainer(
        alignment: alignment,
        duration: const Duration(milliseconds: 300),
        height: height,
        width: width,
        padding: padding,
        decoration: BoxDecoration(
          border: Border.all(
            color: active
                ? AppColors.c2A85F3primary
                : AppColors.cC1E2F3disableOrDivider,
          ),
          color: active ? activeBgColor : null,
          borderRadius: BorderRadius.circular(20),
        ),
        child: child,
      ),
    );
  }
}
