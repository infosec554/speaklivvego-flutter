part of 'initial_info_provider.dart';

class InitialInfoState extends Equatable {
  const InitialInfoState({
    this.step = InitialInfoStepEnum.chooseReason,
    this.reason,
    this.language,
    this.level,
    this.gender = GenderEnum.male,
    this.age = '',
  });

  InitialInfoState copyWith({
    InitialInfoStepEnum? step,
    ReasonEnum? reason,
    LanguageModel? language,
    LevelEnum? level,
    GenderEnum? gender,
    String? age,
  }) => InitialInfoState(
    step: step ?? this.step,
    reason: reason ?? this.reason,
    language: language ?? this.language,
    level: level ?? this.level,
    gender: gender ?? this.gender,
    age: age ?? this.age,
  );

  final InitialInfoStepEnum step;
  final ReasonEnum? reason;
  final LanguageModel? language;
  final LevelEnum? level;
  final GenderEnum gender;
  final String age;

  @override
  List<Object?> get props => [
    step,
    reason,
    language,
    level,
    gender,
    age,
  ];

  bool get isButtonEnabled {
    switch (step) {
      case InitialInfoStepEnum.chooseReason:
        return reason != null;
      case InitialInfoStepEnum.greeting:
        return true;
      case InitialInfoStepEnum.chooseNativeLanguage:
        return language != null;
      case InitialInfoStepEnum.whatIsYourLevel:
        return level != null;
      case InitialInfoStepEnum.genderAndAge:
        return age.isNotEmpty;
    }
  }
}
