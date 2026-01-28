enum AfterCallStepEnum {
  didYouLikeTheTalk,
  adviceAndCompliments,
  writePublicReview,
  leaveFeedback,
}

extension AfterCallStepEnumExtensions on AfterCallStepEnum {
  int get stepNumber {
    switch (this) {
      case AfterCallStepEnum.didYouLikeTheTalk:
        return 1;
      case AfterCallStepEnum.adviceAndCompliments:
        return 2;
      case AfterCallStepEnum.writePublicReview:
        return 3;
      case AfterCallStepEnum.leaveFeedback:
        return 4;
    }
  }
}

