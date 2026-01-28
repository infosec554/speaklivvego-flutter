import 'package:speak_live_go/core/constants/assets/app_icons.dart';

enum PrivateInfoEnum {
  nativeLanguage,
  englishLevel,
  gender,
  age,
  location,
  localTime,
}

extension PrivateInfoEnumExtensions on PrivateInfoEnum {
  String get getIcon {
    switch (this) {
      case PrivateInfoEnum.nativeLanguage:
        return AppIcons.book;
      case PrivateInfoEnum.englishLevel:
        return AppIcons.englishLevel;
      case PrivateInfoEnum.gender:
        return AppIcons.gender;
      case PrivateInfoEnum.age:
        return AppIcons.ageCalendar;
      case PrivateInfoEnum.location:
        return AppIcons.locationFilled;
      case PrivateInfoEnum.localTime:
        return AppIcons.clockThin;
    }
  }

  String get getTitle {
    switch (this) {
      case PrivateInfoEnum.nativeLanguage:
        return 'Native language';
      case PrivateInfoEnum.englishLevel:
        return 'English level';
      case PrivateInfoEnum.gender:
        return 'Gender';
      case PrivateInfoEnum.age:
        return 'Age';
      case PrivateInfoEnum.location:
        return 'Location';
      case PrivateInfoEnum.localTime:
        return 'Local time';
    }
  }
}
