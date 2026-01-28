import 'package:flutter/material.dart';
import 'package:speak_live_go/core/constants/app_colors.dart';
import 'package:speak_live_go/utils/extensions/build_context/text_styles.dart';
import 'package:speak_live_go/features/chats/data/models/chat/chat_model.dart';
import 'package:speak_live_go/features/common/presentation/widgets/app_badge_circle.dart';
import 'package:speak_live_go/features/common/presentation/widgets/app_circle_avatar_with_badge.dart';
import 'package:speak_live_go/features/common/presentation/widgets/app_gap.dart';
import 'package:speak_live_go/features/common/presentation/widgets/buttons/app_tap.dart';

class ChatItem extends StatelessWidget {
  const ChatItem({
    required this.child,
    required this.onTap,
    super.key,
  });

  final ChatModel child;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return AppTap(
      onTap: onTap,
      child: Container(
        height: 90,
        padding: const EdgeInsets.fromLTRB(12, 12, 9, 7),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            AppCircleAvatarWithBadge(
              badge: child.isOnline,
              size: 70,
            ),

            const WBox(4),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    child.name,
                    style: context.cBlackColorTextStyle?.copyWith(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    '${child.id}',
                    style: context.c696969ColorTextStyle?.copyWith(
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  child.getMinuteWithPrefix,
                  style: context.c696969ColorTextStyle?.copyWith(
                    fontSize: 10,
                  ),
                ),
                const HBox(9),
                if (child.callCount != null)
                  AppBadgeCircle(
                    size: 18,
                    bgColor: AppColors.c2A85F3primary,
                    info: '${child.callCount ?? ''}',
                    infoColor: AppColors.white,
                  ),
                const Text(''),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
