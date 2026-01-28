import 'package:speak_live_go/core/constants/assets/app_icons.dart';
import 'package:speak_live_go/core/routing/app_router_points.dart';

enum EditProfileEnum {
  name,
  aboutMe,
  nativeLanguage,
  englishLevel,
  age,
  location,
  interests,
}

extension EditProfileEnumExtensions on EditProfileEnum {
  String get getIcon {
    switch (this) {
      case EditProfileEnum.name:
        return AppIcons.profileEditName;
      case EditProfileEnum.aboutMe:
        return AppIcons.profileEditAboutMe;
      case EditProfileEnum.nativeLanguage:
        return AppIcons.profileEditNativeLanguage;
      case EditProfileEnum.englishLevel:
        return AppIcons.profileEditEnglishLevel;
      case EditProfileEnum.age:
        return AppIcons.profileEditAge;
      case EditProfileEnum.location:
        return AppIcons.profileEditLocation;
      case EditProfileEnum.interests:
        return AppIcons.profileEditInterests;
    }
  }

  String get getTitle {
    switch (this) {
      case EditProfileEnum.name:
        return 'Name';
      case EditProfileEnum.aboutMe:
        return 'About me';
      case EditProfileEnum.nativeLanguage:
        return 'Native language';
      case EditProfileEnum.englishLevel:
        return 'English level';
      case EditProfileEnum.age:
        return 'Age';
      case EditProfileEnum.location:
        return 'Location';
      case EditProfileEnum.interests:
        return 'Interests';
    }
  }
  bool get isName => this == EditProfileEnum.name;
}
