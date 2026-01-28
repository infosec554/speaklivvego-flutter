import 'package:flutter/material.dart';
import 'package:speak_live_go/core/constants/app_colors.dart';
import 'package:speak_live_go/features/common/presentation/widgets/app_circle_avatar_with_badge.dart';
import 'package:speak_live_go/features/common/presentation/widgets/app_gap.dart';
import 'package:speak_live_go/features/initial_info/domain/enums/level_enum.dart';
import 'package:speak_live_go/features/profile/presentation/widgets/profile_box_bg.dart';
import 'package:speak_live_go/utils/extensions/build_context/text_styles.dart';

class FeedbackBox extends StatelessWidget {
  const FeedbackBox({super.key});

  @override
  Widget build(BuildContext context) {
    return ProfileBoxBg(
      title: 'Feedback',
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
      children: [
        for (int i = 1; i < 3; i++) ...[
          Row(
            children: [
              AppCircleAvatarWithBadge(
                badge: LevelEnum.b2.getShortTitle,
                size: 80,
                badgeInfoColor: AppColors.black,
                infoStyle: context.cBlackColorTextStyle?.copyWith(fontSize: 13,),
              ),
              const WBox(20),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'I. Rustam',
                      style: context.cBlackColorTextStyle?.copyWith(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                    const HBox(6),
                    Text(
                      'October 12, 2025',
                      style: context.c696969ColorTextStyle,
                    ),
                  ],
                ),
              ),
              Container(
                height: 70,
                width: 70,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(35),
                  color: AppColors.cDBF5EC,
                ),
                alignment: Alignment.center,
                child: const Text(
                  '👍',
                  style: TextStyle(fontSize: 40),
                ),
              ),
            ],
          ),
          const HBox(20),
        ],
      ],
    );
  }
}
