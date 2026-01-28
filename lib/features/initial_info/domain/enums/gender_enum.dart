enum GenderEnum {
  male,
  female,
}

extension GenderEnumExtensions on GenderEnum {
  String get getTitle => switch (this) {
    GenderEnum.male => 'Male',
    GenderEnum.female => 'Female',
  };

  bool get isMale => GenderEnum.male == this;
}
