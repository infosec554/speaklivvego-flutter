import 'package:speak_live_go/core/constants/assets/app_icons.dart';

enum ContactUsEnum {
  email,
  telegram,
}

extension ContactUsEnumExtensions on ContactUsEnum {
  String get getIcon {
    switch (this) {
      case ContactUsEnum.email:
        return AppIcons.email;
      case ContactUsEnum.telegram:
        return AppIcons.telegram;
    }
  }
}
