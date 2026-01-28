import 'package:flutter/material.dart';
import 'package:speak_live_go/core/constants/app_colors.dart';
import 'package:speak_live_go/core/constants/assets/app_icons.dart';
import 'package:speak_live_go/utils/extensions/build_context/text_styles.dart';
import 'package:speak_live_go/utils/extensions/string_extensions.dart';
import 'package:speak_live_go/features/common/presentation/widgets/app_gap.dart';
import 'package:speak_live_go/features/common/presentation/widgets/buttons/app_tap.dart';

class FindPartnerButton extends StatelessWidget {
  const FindPartnerButton({
    super.key,
    this.onPressed,
  });

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return AppTap(
      onTap: onPressed,
      child: Container(
        height: 56,
        width: double.maxFinite,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        margin: const EdgeInsets.only(bottom: 65),
        child: Material(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(28), // pill shape
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              AppIcons.search.toSvgAsset(
                color: AppColors.white,
              ),
              const WBox(20),
              Text(
                'Find a perfect partner',
                style: context.cWhiteColorTextStyle?.copyWith(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
