import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:speak_live_go/core/constants/app_colors.dart';
import 'package:speak_live_go/features/common/presentation/widgets/app_gap.dart';
import 'package:speak_live_go/utils/extensions/build_context/text_styles.dart';

class LeaveFeedbackStep extends ConsumerWidget {
  const LeaveFeedbackStep({
    required this.onToggleAdvice,
    required this.onToggleCompliments,
    required this.selectedAdvice,
    required this.selectedCompliments,
    super.key,
  });

  final ValueChanged<String> onToggleAdvice;
  final ValueChanged<String> onToggleCompliments;
  final List<String> selectedAdvice;
  final List<String> selectedCompliments;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Leave your feedback',
          style: context.cBlackColorTextStyle?.copyWith(
            fontWeight: FontWeight.w600,
            fontSize: 24,
          ),
        ),
        const HBox(32),
        // Advice section
        Text(
          'Advice',
          style: context.cBlackColorTextStyle?.copyWith(
            fontWeight: FontWeight.w600,
            fontSize: 20,
          ),
        ),
        const HBox(16),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: [
            _buildPillButton(
              context: context,
              text: 'Speak more',
              isSelected: selectedAdvice.contains('Speak more'),
              onTap: () => onToggleAdvice('Speak more'),
              color: AppColors.cC4D0FB, // Light purple
            ),
            _buildPillButton(
              context: context,
              text: 'Listen more',
              isSelected: selectedAdvice.contains('Listen more'),
              onTap: () => onToggleAdvice('Listen more'),
              color: AppColors.cC4D0FB, // Light purple
            ),
          ],
        ),
        const HBox(32),
        // Compliments section
        Text(
          'Compliments',
          style: context.cBlackColorTextStyle?.copyWith(
            fontWeight: FontWeight.w600,
            fontSize: 20,
          ),
        ),
        const HBox(16),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: [
            _buildPillButton(
              context: context,
              text: 'Speak more',
              isSelected: selectedCompliments.contains('Speak more'),
              onTap: () => onToggleCompliments('Speak more'),
              color: AppColors.cC9F2E9, // Light green
            ),
            _buildPillButton(
              context: context,
              text: 'Listen more',
              isSelected: selectedCompliments.contains('Listen more'),
              onTap: () => onToggleCompliments('Listen more'),
              color: AppColors.cC9F2E9, // Light green
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildPillButton({
    required BuildContext context,
    required String text,
    required bool isSelected,
    required VoidCallback onTap,
    required Color color,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        decoration: BoxDecoration(
          color: isSelected ? color : Colors.transparent,
          border: Border.all(
            color: isSelected
                ? AppColors.c2A85F3primary
                : AppColors.cC1E2F3disableOrDivider,
            width: isSelected ? 2 : 1,
          ),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Text(
          text,
          style: context.cBlackColorTextStyle?.copyWith(
            fontWeight: FontWeight.w500,
            fontSize: 16,
            color: isSelected ? AppColors.white : AppColors.black,
          ),
        ),
      ),
    );
  }
}

