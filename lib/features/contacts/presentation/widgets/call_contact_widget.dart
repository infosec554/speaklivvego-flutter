import 'package:flutter/material.dart';
import 'package:speak_live_go/core/constants/app_colors.dart';
import 'package:speak_live_go/features/common/presentation/widgets/app_circle_avatar.dart';
import 'package:speak_live_go/features/common/presentation/widgets/app_gap.dart';
import 'package:speak_live_go/features/contacts/data/models/contact/contact_model.dart';
import 'package:speak_live_go/utils/extensions/build_context/text_styles.dart';
import 'package:speak_live_go/utils/extensions/date_time_extensions.dart';

class CallContactWidget extends StatelessWidget {
  const CallContactWidget({
    required this.item,
    required this.onTap,
    super.key,
  });

  final ContactModel item;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const AppCircleAvatar(),
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
                  Text(
                    item.callDate.getMonthNameDayHHmm,
                    style: context.c696969ColorTextStyle?.copyWith(
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
            Column(
              children: [
                Text(
                  item.talkCount.toString(),
                  style: context.cBlackColorTextStyle?.copyWith(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                ),
                Text(
                  'min',
                  style: context.c696969ColorTextStyle?.copyWith(
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ],
        ),
        const HBox(15),
        Row(
          children: [
            const WBox(76),
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
