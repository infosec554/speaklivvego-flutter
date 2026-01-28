import 'package:flutter/material.dart';
import 'package:speak_live_go/core/constants/app_colors.dart';
import 'package:speak_live_go/core/constants/assets/app_icons.dart';
import 'package:speak_live_go/features/common/presentation/widgets/app_circle_avatar_with_badge.dart';
import 'package:speak_live_go/features/common/presentation/widgets/app_gap.dart';
import 'package:speak_live_go/features/common/presentation/widgets/buttons/app_icon_button.dart';
import 'package:speak_live_go/features/common/presentation/widgets/buttons/app_tap.dart';
import 'package:speak_live_go/features/common/presentation/widgets/rate_and_gender.dart';
import 'package:speak_live_go/features/contacts/data/models/contact/contact_model.dart';
import 'package:speak_live_go/features/contacts/presentation/widgets/network_status_tile.dart';
import 'package:speak_live_go/features/initial_info/domain/enums/level_enum.dart';
import 'package:speak_live_go/utils/extensions/build_context/text_styles.dart';

class FriendOrNotFriendWidget extends StatelessWidget {
  const FriendOrNotFriendWidget({
    required this.item,
    required this.onTap,
    required this.onAction,
    super.key,
  });

  final ContactModel item;
  final VoidCallback onTap;
  final VoidCallback onAction;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            AppCircleAvatarWithBadge(
              size: 70,
              badge: item.level.getShortTitle,
              badgeBgColor: item.isBlocked
                  ? AppColors.cD9D9D9
                  : AppColors.cA7CEFF,
              badgeInfoColor: item.isBlocked
                  ? AppColors.black
                  : AppColors.white,
            ),
            const WBox(6),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.name,
                    style: context.cBlackColorTextStyle?.copyWith(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                  ),
                  const HBox(5),
                  RateAndGender(
                    mainAxisAlignment: MainAxisAlignment.start,
                    rate: item.rating,
                    gender: item.gender,
                  ),
                  Text(
                    '${item.country} - ${item.talkCount} talks',
                    style: context.c696969ColorTextStyle?.copyWith(
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
            AppTap(
              onTap: onAction,
              child: Column(
                children: [
                  AppIconButton(
                    icon: item.isBlocked
                        ? AppIcons.unlock
                        : AppIcons.folderMinus,
                  ),
                  const HBox(2),
                  Text(
                    item.isBlocked ? 'Unlock' : 'Remove',
                    style: context.c696969ColorTextStyle?.copyWith(
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        const HBox(4),
        Row(
          children: [
            SizedBox(
              width: 76,
              child: NetworkStatusTile(
                isOnline: item.isOnline,
              ),
            ),
            Expanded(
              child: Container(
                height: 1,
                width: double.maxFinite,
                decoration: const BoxDecoration(
                  color: AppColors.c696969,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
