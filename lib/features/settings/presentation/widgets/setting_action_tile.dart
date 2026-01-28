import 'package:flutter/material.dart';
import 'package:speak_live_go/core/constants/app_colors.dart';
import 'package:speak_live_go/core/constants/assets/app_icons.dart';
import 'package:speak_live_go/features/common/presentation/widgets/app_gap.dart';
import 'package:speak_live_go/features/common/presentation/widgets/buttons/app_tap.dart';
import 'package:speak_live_go/features/profile/domain/enums/settings_enum.dart';
import 'package:speak_live_go/utils/extensions/build_context/text_styles.dart';
import 'package:speak_live_go/utils/extensions/string_extensions.dart';

class SettingActionTile extends StatelessWidget {
  const SettingActionTile({
    required this.onTap,
    this.toggle,
    required this.v,
    super.key,
  });

  final VoidCallback onTap;
  final Widget? toggle;
  final SettingsEnum v;

  @override
  Widget build(BuildContext context) {
    return AppTap(
      onTap: onTap,
      child: Row(
        children: [
          v.getIcon.toSvgAsset(
            color: AppColors.c2A85F3primary,
          ),
          const WBox(12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  v.getTitle,
                  style: context.cBlackColorTextStyle?.copyWith(
                    fontSize: 16,
                  ),
                ),
                if (v.showSubtitle) ...[
                  const HBox(4),
                  Text(
                    'degallacticolegalaso@gmail.com',
                    // TODO: Get from profile
                    style: context.c696969ColorTextStyle?.copyWith(
                      fontSize: 12,
                    ),
                  ),
                ],
              ],
            ),
          ),
          if (toggle != null) ...[
            toggle!,
          ] else if (v.hasRating) ...[
            Row(
              children: List.generate(
                5,
                (index) => Container(
                  height: 41,
                  width: 36,
                  alignment: Alignment.center,
                  child: AppIcons.ratingStar.toSvgAsset(),
                ),
              ),
            ),
          ] else ...[
            AppIcons.chevronRight.toSvgAsset(),
          ],
        ],
      ),
    );
  }
}
