part of 'after_call_provider.dart';

class AfterCallState extends Equatable {
  const AfterCallState({
    this.step = AfterCallStepEnum.didYouLikeTheTalk,
    this.likedTalk,
    this.advice = const [],
    this.compliments = const [],
    this.publicReview = '',
    this.feedbackAdvice = const [],
    this.feedbackCompliments = const [],
  });

  final AfterCallStepEnum step;
  final bool? likedTalk;
  final List<String> advice;
  final List<String> compliments;
  final String publicReview;
  final List<String> feedbackAdvice;
  final List<String> feedbackCompliments;

  AfterCallState copyWith({
    AfterCallStepEnum? step,
    bool? likedTalk,
    List<String>? advice,
    List<String>? compliments,
    String? publicReview,
    List<String>? feedbackAdvice,
    List<String>? feedbackCompliments,
  }) =>
      AfterCallState(
        step: step ?? this.step,
        likedTalk: likedTalk ?? this.likedTalk,
        advice: advice ?? this.advice,
        compliments: compliments ?? this.compliments,
        publicReview: publicReview ?? this.publicReview,
        feedbackAdvice: feedbackAdvice ?? this.feedbackAdvice,
        feedbackCompliments: feedbackCompliments ?? this.feedbackCompliments,
      );

  @override
  List<Object?> get props => [
        step,
        likedTalk,
        advice,
        compliments,
        publicReview,
        feedbackAdvice,
        feedbackCompliments,
      ];

  bool get isButtonEnabled {
    switch (step) {
      case AfterCallStepEnum.didYouLikeTheTalk:
        return likedTalk != null;
      case AfterCallStepEnum.adviceAndCompliments:
        return true; // Can continue without selection
      case AfterCallStepEnum.writePublicReview:
        return true; // Can continue with empty review
      case AfterCallStepEnum.leaveFeedback:
        return true; // Can continue without selection
    }
  }
}

