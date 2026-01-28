import 'package:flutter/material.dart';
import 'package:speak_live_go/core/constants/app_colors.dart';
import 'package:speak_live_go/features/common/presentation/widgets/app_badge_circle.dart';
import 'package:speak_live_go/features/common/presentation/widgets/app_circle_avatar.dart';

class AppCircleAvatarWithBadge extends StatelessWidget {
  const AppCircleAvatarWithBadge({
    this.size = 112,
    super.key,
    this.avatarUrl,
    this.badge,
    this.badgeBgColor,
    this.badgeInfoColor,
    this.infoStyle,
  }) : assert(
         badge is String || badge is bool,
         'badge must be either a String or a bool',
       );

  final double size;
  final String? avatarUrl;
  final dynamic badge;
  final Color? badgeBgColor;
  final Color? badgeInfoColor;
  final TextStyle? infoStyle;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size + (size / 14),
      width: size,
      child: Stack(
        children: [
          Positioned(
            top: 0,

            child: AppCircleAvatar(
              avatarUrl: avatarUrl,
              size: size,
            ),
          ),
          Positioned(
            bottom: 0,
            right: 5,
            child: Builder(
              builder: (context) {
                if (badge is String) {
                  return AppBadgeCircle(
                    size: 30,
                    bgColor: badgeBgColor ?? AppColors.cE2E2E2,
                    info: badge as String,
                    infoColor: badgeInfoColor,
                    infoStyle: infoStyle,
                  );
                }
                if (badge is bool) {
                  return Container(
                    height: 18,
                    width: 18,
                    decoration: BoxDecoration(
                      color: badge as bool
                          ? AppColors.c42BB55green
                          : AppColors.cD9D9D9,
                      borderRadius: BorderRadius.circular(9),
                    ),
                  );
                }
                return const SizedBox.shrink();
              },
            ),
          ),
        ],
      ),
    );
  }
}
