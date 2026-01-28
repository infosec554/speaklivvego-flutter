import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:speak_live_go/core/constants/app_colors.dart';
import 'package:speak_live_go/utils/extensions/build_context/text_styles.dart';
import 'package:speak_live_go/features/auth/presentation/widgets/step_skeleton.dart';
import 'package:speak_live_go/features/common/presentation/widgets/app_activity_container.dart';
import 'package:speak_live_go/features/common/presentation/widgets/app_gap.dart';
import 'package:speak_live_go/features/initial_info/domain/enums/gender_enum.dart';

class GenderAndAgeStep extends StatelessWidget {
  const GenderAndAgeStep({
    required this.title,
    required this.onGenderChange,
    required this.onContinue,
    required this.onAgeChanged,
    required this.currentGender,
    required this.onBack,
    super.key,
  });

  final GenderEnum currentGender;
  final ValueChanged<GenderEnum> onGenderChange;
  final ValueChanged<String> onAgeChanged;
  final VoidCallback? onContinue;
  final VoidCallback onBack;
  final String title;

  @override
  Widget build(BuildContext context) {
    return StepSkeleton(
      onBackPressed: onBack,
      onContinue: onContinue,
      title: title,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Select your gender',
          style: context.cBlackColorTextStyle?.copyWith(
            fontWeight: FontWeight.w500,
            fontSize: 20,
          ),
        ),
        const HBox(12),
        Row(
          spacing: 12,
          children: [
            for (final v in GenderEnum.values)
              Expanded(
                flex: v.isMale ? 30 : 35,
                child: AppActivityContainer(
                  padding: null,
                  onTap: () => onGenderChange (v),
                  active: currentGender == v,
                  height: 60,
                  alignment: Alignment.center,
                  child: Text(
                    v.getTitle,
                    style: context.c2A85F3primaryColorTextStyle?.copyWith(
                      color: v == currentGender ? null : AppColors.c7BAFAF,
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
          ],
        ),
        const HBox(24),
        Text(
          'Enter your age',
          style: context.cBlackColorTextStyle?.copyWith(
            fontWeight: FontWeight.w500,
            fontSize: 20,
          ),
        ),
        const HBox(12),
        TextField(
          onChanged: onAgeChanged,
          style: context.c2A85F3primaryColorTextStyle?.copyWith(
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
          ],
          maxLength: 3,
          decoration: const InputDecoration(counterText: ''),

          keyboardType: TextInputType.number,
        ),
        const Spacer(),
      ],
    );
  }
}
