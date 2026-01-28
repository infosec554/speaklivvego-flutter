import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:speak_live_go/core/constants/app_colors.dart';
import 'package:speak_live_go/core/constants/assets/app_icons.dart';
import 'package:speak_live_go/features/common/presentation/widgets/app_activity_container.dart';
import 'package:speak_live_go/features/common/presentation/widgets/app_gap.dart';
import 'package:speak_live_go/utils/extensions/build_context/text_styles.dart';
import 'package:speak_live_go/utils/extensions/string_extensions.dart';

class DidYouLikeTalkStep extends ConsumerWidget {
  const DidYouLikeTalkStep({
    required this.onChangeLiked,
    required this.currentLiked,
    super.key,
  });

  final ValueChanged<bool> onChangeLiked;
  final bool? currentLiked;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        Text(
          'Did you like the talk?',
          style: context.cBlackColorTextStyle?.copyWith(
            fontWeight: FontWeight.w600,
            fontSize: 24,
          ),
          textAlign: TextAlign.center,
        ),
        const HBox(40),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Yes button
            Expanded(
              child: AppActivityContainer(
                active: currentLiked == true,
                activeBgColor: AppColors.cDBF5EC,
                onTap: () => onChangeLiked(true),
                padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
                child: Column(
                  children: [
                    AppIcons.thumbsUp.toSvgAsset(height: 40, width: 40),
                    const HBox(12),
                    Text(
                      'Yes, I do',
                      style: context.cBlackColorTextStyle?.copyWith(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const WBox(16),
            // No button
            Expanded(
              child: AppActivityContainer(
                active: currentLiked == false,
                onTap: () => onChangeLiked(false),
                padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
                child: Column(
                  children: [
                    // Using thumbs up rotated or a different icon - since thumbs_down doesn't exist
                    // We'll use a rotated thumbs up or create a visual representation
                    Transform.rotate(
                      angle: 3.14159, // 180 degrees
                      child: AppIcons.thumbsUp.toSvgAsset(height: 40, width: 40),
                    ),
                    const HBox(12),
                    Text(
                      'Not really',
                      style: context.cBlackColorTextStyle?.copyWith(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

