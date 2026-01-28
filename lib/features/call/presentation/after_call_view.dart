import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:speak_live_go/core/constants/app_colors.dart';
import 'package:speak_live_go/features/call/domain/enums/after_call_step_enum.dart';
import 'package:speak_live_go/features/call/presentation/providers/after_call/after_call_provider.dart';
import 'package:speak_live_go/features/call/presentation/steps/advice_and_compliments_step.dart';
import 'package:speak_live_go/features/call/presentation/steps/did_you_like_talk_step.dart';
import 'package:speak_live_go/features/call/presentation/steps/leave_feedback_step.dart';
import 'package:speak_live_go/features/call/presentation/steps/write_public_review_step.dart';
import 'package:speak_live_go/features/common/presentation/widgets/app_circle_avatar_with_badge.dart';
import 'package:speak_live_go/features/common/presentation/widgets/app_gap.dart';
import 'package:speak_live_go/features/common/presentation/widgets/buttons/app_button.dart';
import 'package:speak_live_go/utils/extensions/build_context/text_styles.dart';

class AfterCallView extends ConsumerWidget {
  const AfterCallView({
    this.partnerName = 'M. Salima',
    this.partnerAvatarUrl,
    this.partnerBadge = 'B2',
    this.duration = '01:06',
    super.key,
  });

  final String partnerName;
  final String? partnerAvatarUrl;
  final String partnerBadge;
  final String duration;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(afterCallProvider);
    final notifier = ref.watch(afterCallProvider.notifier);

    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Custom header
            _buildHeader(context, state.step),
            // Step content
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: SingleChildScrollView(
                  child: _buildStepContent(context, state, notifier),
                ),
              ),
            ),
            // Continue button
            Padding(
              padding: const EdgeInsets.all(20),
              child: AppButton(
                title: 'Continue',
                onPressed: state.isButtonEnabled
                    ? () {
                        if (state.step == AfterCallStepEnum.leaveFeedback) {
                          // Complete the flow - navigate back
                          context.pop();
                        } else {
                          notifier.goNextStep();
                        }
                      }
                    : null,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context, AfterCallStepEnum currentStep) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 24),
      child: Column(
        children: [
          // Top row: X button and step indicators
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // X button
              IconButton(
                icon: const Icon(Icons.close, color: AppColors.black),
                onPressed: () => context.pop(),
              ),
              // Step indicators (3 dots representing progress through 4 steps)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(3, (index) {
                  // Progressive dots: step 1 = dot 1, step 2 = dot 1, step 3 = dots 1-2, step 4 = all dots
                  final isActive = (index == 0 && currentStep.stepNumber >= 1) ||
                      (index == 1 && currentStep.stepNumber >= 3) ||
                      (index == 2 && currentStep.stepNumber >= 4);
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(
                      color: isActive
                          ? AppColors.c2A85F3primary
                          : AppColors.cC1E2F3disableOrDivider,
                      shape: BoxShape.circle,
                    ),
                  );
                }),
              ),
              // Spacer to balance the layout
              const SizedBox(width: 48),
            ],
          ),
          const HBox(24),
          // Profile picture with badge
          AppCircleAvatarWithBadge(
            size: 80,
            avatarUrl: partnerAvatarUrl,
            badge: partnerBadge,
            badgeBgColor: AppColors.c2A85F3primary,
            badgeInfoColor: AppColors.white,
          ),
          const HBox(16),
          // Name
          Text(
            partnerName,
            style: context.cBlackColorTextStyle?.copyWith(
              fontWeight: FontWeight.w600,
              fontSize: 20,
            ),
          ),
          const HBox(8),
          // Duration
          Text(
            'Duration $duration',
            style: context.c696969ColorTextStyle?.copyWith(
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStepContent(
    BuildContext context,
    AfterCallState state,
    AfterCallNotifier notifier,
  ) {
    switch (state.step) {
      case AfterCallStepEnum.didYouLikeTheTalk:
        return DidYouLikeTalkStep(
          onChangeLiked: (liked) => notifier.setLikedTalk(liked),
          currentLiked: state.likedTalk,
        );
      case AfterCallStepEnum.adviceAndCompliments:
        return AdviceAndComplimentsStep(
          onToggleAdvice: (advice) => notifier.toggleAdvice(advice),
          onToggleCompliments: (compliment) =>
              notifier.toggleCompliments(compliment),
          selectedAdvice: state.advice,
          selectedCompliments: state.compliments,
        );
      case AfterCallStepEnum.writePublicReview:
        return WritePublicReviewStep(
          onReviewChanged: (review) => notifier.setPublicReview(review),
          review: state.publicReview,
        );
      case AfterCallStepEnum.leaveFeedback:
        return LeaveFeedbackStep(
          onToggleAdvice: (advice) => notifier.toggleFeedbackAdvice(advice),
          onToggleCompliments: (compliment) =>
              notifier.toggleFeedbackCompliments(compliment),
          selectedAdvice: state.feedbackAdvice,
          selectedCompliments: state.feedbackCompliments,
        );
    }
  }
}

