import 'package:equatable/equatable.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:speak_live_go/features/call/domain/enums/after_call_step_enum.dart';

part 'after_call_state.dart';

final afterCallProvider =
    AutoDisposeNotifierProvider<AfterCallNotifier, AfterCallState>(
  AfterCallNotifier.new,
);

class AfterCallNotifier extends AutoDisposeNotifier<AfterCallState> {
  void updateState(AfterCallState v) {
    state = v;
  }

  @override
  AfterCallState build() {
    return const AfterCallState();
  }

  void goNextStep() {
    AfterCallStepEnum? next;
    switch (state.step) {
      case AfterCallStepEnum.didYouLikeTheTalk:
        next = AfterCallStepEnum.adviceAndCompliments;
        break;
      case AfterCallStepEnum.adviceAndCompliments:
        next = AfterCallStepEnum.writePublicReview;
        break;
      case AfterCallStepEnum.writePublicReview:
        next = AfterCallStepEnum.leaveFeedback;
        break;
      case AfterCallStepEnum.leaveFeedback:
        // Complete the flow - could navigate back or show completion
        return;
    }
    if (next != null) {
      updateState(state.copyWith(step: next));
    }
  }

  void goPreviousStep() {
    AfterCallStepEnum? previous;
    switch (state.step) {
      case AfterCallStepEnum.didYouLikeTheTalk:
        return; // Can't go back from first step
      case AfterCallStepEnum.adviceAndCompliments:
        previous = AfterCallStepEnum.didYouLikeTheTalk;
        break;
      case AfterCallStepEnum.writePublicReview:
        previous = AfterCallStepEnum.adviceAndCompliments;
        break;
      case AfterCallStepEnum.leaveFeedback:
        previous = AfterCallStepEnum.writePublicReview;
        break;
    }
    if (previous != null) {
      updateState(state.copyWith(step: previous));
    }
  }

  void setLikedTalk(bool liked) {
    updateState(state.copyWith(likedTalk: liked));
  }

  void toggleAdvice(String advice) {
    final currentAdvice = List<String>.from(state.advice);
    if (currentAdvice.contains(advice)) {
      currentAdvice.remove(advice);
    } else {
      currentAdvice.add(advice);
    }
    updateState(state.copyWith(advice: currentAdvice));
  }

  void toggleCompliments(String compliment) {
    final currentCompliments = List<String>.from(state.compliments);
    if (currentCompliments.contains(compliment)) {
      currentCompliments.remove(compliment);
    } else {
      currentCompliments.add(compliment);
    }
    updateState(state.copyWith(compliments: currentCompliments));
  }

  void setPublicReview(String review) {
    updateState(state.copyWith(publicReview: review));
  }

  void toggleFeedbackAdvice(String advice) {
    final currentAdvice = List<String>.from(state.feedbackAdvice);
    if (currentAdvice.contains(advice)) {
      currentAdvice.remove(advice);
    } else {
      currentAdvice.add(advice);
    }
    updateState(state.copyWith(feedbackAdvice: currentAdvice));
  }

  void toggleFeedbackCompliments(String compliment) {
    final currentCompliments = List<String>.from(state.feedbackCompliments);
    if (currentCompliments.contains(compliment)) {
      currentCompliments.remove(compliment);
    } else {
      currentCompliments.add(compliment);
    }
    updateState(state.copyWith(feedbackCompliments: currentCompliments));
  }
}

