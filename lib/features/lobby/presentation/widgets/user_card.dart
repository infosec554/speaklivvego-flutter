import 'package:flutter/material.dart';
import 'package:speak_live_go/core/constants/app_colors.dart';
import 'package:speak_live_go/core/constants/app_shadows.dart';
import 'package:speak_live_go/features/common/presentation/widgets/app_circle_avatar_with_badge.dart';
import 'package:speak_live_go/features/common/presentation/widgets/app_gap.dart';
import 'package:speak_live_go/features/common/presentation/widgets/buttons/app_tap.dart';
import 'package:speak_live_go/features/common/presentation/widgets/rate_and_gender.dart';
import 'package:speak_live_go/features/initial_info/domain/enums/level_enum.dart';
import 'package:speak_live_go/features/lobby/data/models/user_light/user_light_model.dart';
import 'package:speak_live_go/utils/extensions/build_context/text_styles.dart';

class UserCard extends StatelessWidget {
  const UserCard({
    required this.user,
    super.key,
    this.onTap,
  });

  final VoidCallback? onTap;
  final UserLightModel user;

  @override
  Widget build(BuildContext context) {
    return AppTap(
      onTap: onTap,
      child: Container(
        width: 150,
        height: 233,
        decoration: const BoxDecoration(
          boxShadow: AppShadows.userCard,
          color: AppColors.white,
          borderRadius: BorderRadius.all(
            Radius.elliptical(12, 12),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            AppCircleAvatarWithBadge(
              badge: user.level.getShortTitle,
            ),
            const Spacer(),

            Text(
              user.name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: context.cBlackColorTextStyle?.copyWith(
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
            ),
            RateAndGender(
              rate: user.rating,
              gender: user.gender,
            ),
            const HBox(8),
            Container(
              width: double.maxFinite,
              height: 45,
              decoration: const BoxDecoration(
                color: AppColors.c42BB55green,
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.elliptical(12, 12),
                ),
              ),
              alignment: Alignment.center,
              child: Text(
                'Talk Now',
                style: context.cWhiteColorTextStyle?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
