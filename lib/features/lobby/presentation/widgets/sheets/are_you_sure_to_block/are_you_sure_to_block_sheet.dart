import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:speak_live_go/core/constants/app_colors.dart';
import 'package:speak_live_go/features/common/presentation/widgets/app_circle_avatar.dart';
import 'package:speak_live_go/features/common/presentation/widgets/app_gap.dart';
import 'package:speak_live_go/features/common/presentation/widgets/bg_wrappers/app_sheet_bg_wrapper.dart';
import 'package:speak_live_go/features/common/presentation/widgets/buttons/app_button.dart';
import 'package:speak_live_go/features/common/presentation/widgets/buttons/app_secondary_button.dart';
import 'package:speak_live_go/utils/extensions/build_context/text_styles.dart';

class AreYouSureToBlockSheet extends StatelessWidget {
  const AreYouSureToBlockSheet({
    required this.userName,
    this.avatarUrl,
    this.onBlock,
    super.key,
  });

  final String userName;
  final String? avatarUrl;
  final VoidCallback? onBlock;

  @override
  Widget build(BuildContext context) {
    return AppSheetBgWrapper(
      title: '',
      children: [
        // Avatar/Emoji
        Container(
          height: 100,
          width: 100,
          decoration: BoxDecoration(
            color: AppColors.cA9CBFF,
            borderRadius: BorderRadius.circular(50),
          ),
          child: const Center(
            child: Text(
              "🤔",
              style: TextStyle(fontSize: 60),
            ),
          ),
        ),
        const HBox(24),
        // Question text
        Text(
          'Are you sure you want to block',
          textAlign: TextAlign.center,
          style: context.cBlackColorTextStyle?.copyWith(
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
        ),
        const HBox(8),
        // User name in blue
        Text(
          '$userName?',
          textAlign: TextAlign.center,
          style: context.c2A85F3primaryColorTextStyle?.copyWith(
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
        ),
        const HBox(12),
        // Explanation text
        Text(
          'This user won\'t be able to call or message you. They\'ll always see you as offline',
          textAlign: TextAlign.center,
          style: context.c696969ColorTextStyle?.copyWith(
            fontSize: 14,
          ),
        ),
        const HBox(24),
        // Block button
        AppButton(
          title: 'Block',
          onPressed: onBlock ??
              () {
                // TODO: Implement block user API call
                context.pop();
              },
        ),
        const HBox(12),
        // Cancel button
        AppSecondaryButton(
          title: 'Cancel',
          onPressed: () {
            context.pop();
          },
        ),
      ],
    );
  }
}

