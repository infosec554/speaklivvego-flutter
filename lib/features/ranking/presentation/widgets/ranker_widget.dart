import 'package:flutter/material.dart';
import 'package:speak_live_go/core/constants/app_colors.dart';
import 'package:speak_live_go/features/common/presentation/widgets/app_circle_avatar.dart';
import 'package:speak_live_go/features/common/presentation/widgets/app_gap.dart';
import 'package:speak_live_go/utils/extensions/build_context/text_styles.dart';

class RankerWidget extends StatelessWidget {
  const RankerWidget({
    required this.index,
    required this.name,
    required this.minute,
    super.key,
  });

  final int index;
  final String name;
  final int minute;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 92,
      width: double.maxFinite,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Container(
            height: 24,
            width: 24,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: AppColors.cE6E6E6,
              ),
            ),
            alignment: Alignment.center,
            child: Text(
              '$index',
              style: context.c858494ColorTextStyle?.copyWith(
                fontWeight: FontWeight.w500,
                fontSize: 12,
              ),
            ),
          ),
          const WBox(16),
          const AppCircleAvatar(
            size: 56,
          ),
          const WBox(16),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: context.c0C092AColorTextStyle?.copyWith(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                ),
                const HBox(4),
                Text(
                  '$minute min',
                  style: context.c858494ColorTextStyle,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
