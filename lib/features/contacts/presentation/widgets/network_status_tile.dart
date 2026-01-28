import 'package:flutter/material.dart';
import 'package:speak_live_go/core/constants/app_colors.dart';
import 'package:speak_live_go/features/common/presentation/widgets/app_badge_circle.dart';
import 'package:speak_live_go/features/common/presentation/widgets/app_gap.dart';
import 'package:speak_live_go/utils/extensions/boolean_extensions.dart';
import 'package:speak_live_go/utils/extensions/build_context/text_styles.dart';

class NetworkStatusTile extends StatelessWidget {
  const NetworkStatusTile({required this.isOnline, super.key});

  final bool isOnline;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AppBadgeCircle(
          size: 6,
          bgColor: isOnline ? AppColors.c42BB55green : AppColors.cD61017,
        ),
        const WBox(4),
        Text(
          isOnline.toDisplayAsNetworkStatus.toLowerCase(),
          style: context.cBlackColorTextStyle?.copyWith(
            fontSize: 10,
          ),
        ),
      ],
    );
  }
}
