import 'package:flutter/material.dart';
import 'package:speak_live_go/features/common/presentation/widgets/app_circle_avatar_with_badge.dart';
import 'package:speak_live_go/features/common/presentation/widgets/app_gap.dart';
import 'package:speak_live_go/features/common/presentation/widgets/buttons/app_tap.dart';
import 'package:speak_live_go/features/common/presentation/widgets/rate_and_gender.dart';
import 'package:speak_live_go/features/lobby/data/models/user_light/user_light_model.dart';
import 'package:speak_live_go/features/lobby/domain/enums/call_button_type_enum.dart';
import 'package:speak_live_go/features/lobby/presentation/widgets/call_button.dart';
import 'package:speak_live_go/utils/extensions/build_context/text_styles.dart';

class UserTile extends StatelessWidget {
  const UserTile({
    required this.item,
    required this.onTap,
    required this.onCall,
    required this.type,
    super.key,
  });

  final UserLightModel item;
  final VoidCallback onTap;
  final VoidCallback onCall;
  final CallButtonTypeEnum type;

  @override
  Widget build(BuildContext context) {
    return AppTap(
      onTap: onTap,
      child: Row(
        children: [
          const WBox(20),
          AppCircleAvatarWithBadge(
            badge: item.isOnline,
            size: 70,
          ),
          const WBox(4),
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
                RateAndGender(
                  rate: item.rating,
                  gender: item.gender,
                  mainAxisAlignment: MainAxisAlignment.start,
                ),
                Text(
                  '${item.country} - ${item.talkCount}',
                  style: context.c696969ColorTextStyle?.copyWith(
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          CallButton(
            onTap: () {},
            type: type,
          ),
          const WBox(4),
        ],
      ),
    );
  }
}
