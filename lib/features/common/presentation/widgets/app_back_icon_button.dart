import 'package:flutter/material.dart';
import 'package:speak_live_go/core/constants/app_colors.dart';
import 'package:speak_live_go/core/constants/assets/app_icons.dart';
import 'package:speak_live_go/features/common/presentation/widgets/buttons/app_tap.dart';
import 'package:speak_live_go/utils/extensions/string_extensions.dart';

class AppBackIconButton extends StatelessWidget {
  const AppBackIconButton({required this.onPressed, super.key});

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return AppTap(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.only(left: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                  color: AppColors.c2A85F3primary,
                  width: 2,
                ),
              ),
              alignment: Alignment.center,
              child: AppIcons.appBarBackButton.toSvgAsset(),
            ),
          ],
        ),
      ),
    );
  }
}
