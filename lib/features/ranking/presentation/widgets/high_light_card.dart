import 'package:flutter/material.dart';
import 'package:speak_live_go/core/constants/app_colors.dart';
import 'package:speak_live_go/features/common/presentation/widgets/app_gap.dart';
import 'package:speak_live_go/utils/extensions/build_context/text_styles.dart';

class HighLightCard extends StatelessWidget {
  const HighLightCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(36, 0, 20, 37),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.c2A85F3primary,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Container(
            height: 56,
            width: 56,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: AppColors.cFFA521,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              '#4',
              style: context.cWhiteColorTextStyle?.copyWith(
                fontSize: 24,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const WBox(16),
          Expanded(
            child: Text(
              'You are doing better than 60% of other players!',
              style: context.cWhiteColorTextStyle?.copyWith(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
