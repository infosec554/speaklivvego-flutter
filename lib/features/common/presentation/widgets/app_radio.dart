import 'package:flutter/material.dart';
import 'package:speak_live_go/core/constants/app_colors.dart';

class AppRadio extends StatelessWidget {
  const AppRadio({
    required this.active,
    super.key,
  });

  final bool active;

  @override
  Widget build(BuildContext context) {
    final color = active ? AppColors.c2A85F3primary : AppColors.c696969;
    return AnimatedContainer(
      height: 20,
      width: 20,
      decoration: BoxDecoration(
        border: Border.all(width: 2, color: color),
        borderRadius: BorderRadius.circular(10),
      ),
      duration: const Duration(
        milliseconds: 300,
      ),
      alignment: Alignment.center,
      child: Builder(
        builder: (context) {
          if (active) {
            return Container(
              height: 12,
              width: 12,
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(6),
              ),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
