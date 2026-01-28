import 'package:flutter/material.dart';
import 'package:speak_live_go/core/constants/app_colors.dart';
import 'package:speak_live_go/features/common/presentation/widgets/app_circle_avatar.dart';
import 'package:speak_live_go/features/common/presentation/widgets/app_gap.dart';
import 'package:speak_live_go/utils/extensions/build_context/text_styles.dart';

class RankerOnPodium extends StatelessWidget {
  const RankerOnPodium({
    required this.bgColor,
    required this.rank,
    super.key,
    this.avatarUrl,
  });

  final Color bgColor;
  final String? avatarUrl;
  final String rank;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        AppCircleAvatar(
          size: 56,
          avatarUrl: avatarUrl,
          bgColor: bgColor,
        ),
        const HBox(48),
        Container(
          height: 34,
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            color: AppColors.c2A85F3primary,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            rank,
            style: context.cWhiteColorTextStyle?.copyWith(
              fontWeight: FontWeight.w500,
              fontSize: 12,
            ),
          ),
        ),
      ],
    );
  }
}
