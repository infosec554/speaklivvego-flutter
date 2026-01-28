enum InitialInfoStepEnum {
  chooseReason,
  greeting,
  chooseNativeLanguage,
  whatIsYourLevel,
  genderAndAge,
}

extension InitialInfoStepEnumExtensions on InitialInfoStepEnum {
  String get getTitle {
    switch (this) {
      case InitialInfoStepEnum.chooseReason:
        return 'Choose your reason';
      case InitialInfoStepEnum.greeting:
        return '';
      case InitialInfoStepEnum.chooseNativeLanguage:
        return 'Choose your native language?';
      case InitialInfoStepEnum.whatIsYourLevel:
        return 'What is your level';
      case InitialInfoStepEnum.genderAndAge:
        return 'Who are you?';
    }
  }
}
