import 'package:flutter/material.dart';
import 'package:speak_live_go/core/constants/app_colors.dart';
import 'package:speak_live_go/utils/extensions/build_context/text_styles.dart';
import 'package:speak_live_go/utils/extensions/string_extensions.dart';
import 'package:speak_live_go/features/auth/presentation/widgets/step_skeleton.dart';
import 'package:speak_live_go/features/common/presentation/widgets/app_activity_container.dart';
import 'package:speak_live_go/features/common/presentation/widgets/app_gap.dart';
import 'package:speak_live_go/features/initial_info/domain/enums/reason_enum.dart';

class ChooseReasonStep extends StatelessWidget {
  const ChooseReasonStep({
    required this.onChangeReason,
    required this.onContinue,
    super.key,
    this.currentReason,
  });

  final ReasonEnum? currentReason;
  final ValueChanged<ReasonEnum> onChangeReason;
  final VoidCallback? onContinue;

  @override
  Widget build(BuildContext context) {
    return StepSkeleton(
      onContinue: onContinue,
      children: [
        Text(
          'Choose your reason?',
          style: context.cBlackColorTextStyle?.copyWith(
            fontWeight: FontWeight.w600,
            fontSize: 20,
          ),
        ),
        const HBox(60),
        for (final v in ReasonEnum.values) ...[
          AppActivityContainer(
            activeBgColor: AppColors.cF0F4F3,
            onTap: () => onChangeReason(v),
            active: v == currentReason,
            child: Row(
              children: [
                v.getIconOnTile.toAssetImage(),
                const WBox(24),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        v.getTitle,
                        style: context.cBlackColorTextStyle?.copyWith(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                        ),
                      ),
                      const HBox(6),
                      Text(
                        v.getDescription,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const HBox(24),
        ],
        const Spacer(),
      ],
    );
  }
}
