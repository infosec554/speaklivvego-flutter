import 'package:flutter/material.dart';
import 'package:speak_live_go/core/constants/app_colors.dart';
import 'package:speak_live_go/core/constants/assets/app_icons.dart';
import 'package:speak_live_go/utils/extensions/boolean_extensions.dart';
import 'package:speak_live_go/utils/extensions/build_context/text_styles.dart';
import 'package:speak_live_go/utils/extensions/string_extensions.dart';
import 'package:speak_live_go/features/chats/data/models/chat/chat_model.dart';
import 'package:speak_live_go/features/common/presentation/widgets/app_circle_avatar.dart';
import 'package:speak_live_go/features/common/presentation/widgets/app_gap.dart';
import 'package:speak_live_go/features/common/presentation/widgets/buttons/app_tap.dart';

class ChatAppBar extends StatelessWidget {
  const ChatAppBar({
    required this.item,
    required this.onCall,
    required this.onMore,
    super.key,
  });

  final ChatModel item;
  final VoidCallback onCall;
  final VoidCallback onMore;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      height: 115,
      child: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 30, 20, 16),
              child: Row(
                children: [
                  const AppCircleAvatar(),
                  const WBox(8),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item.name,
                          style: context.cBlackColorTextStyle?.copyWith(
                            fontSize: 24,
                          ),
                        ),
                        Text(
                          item.isOnline.toDisplayAsNetworkStatus,
                          style: context.c2A85F3primaryColorTextStyle?.copyWith(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  _IB(onTap: onCall, icon: AppIcons.callChatPage),
                  const WBox(12),
                  _IB(onTap: onMore, icon: AppIcons.moreVertical),
                ],
              ),
            ),
          ),
          Container(
            height: 1,
            color: AppColors.cD5D7D9,
            width: double.maxFinite,
            margin: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
          ),
        ],
      ),
    );
  }
}

class _IB extends StatelessWidget {
  const _IB({
    required this.onTap,
    required this.icon,
  });

  final VoidCallback onTap;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return AppTap(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        height: 56,
        width: 56,
        decoration: BoxDecoration(
          color: AppColors.cF3F5F7,
          borderRadius: BorderRadius.circular(28),
        ),
        child: icon.toSvgAsset(),
      ),
    );
  }
}
