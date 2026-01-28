import 'package:speak_live_go/core/constants/assets/app_icons.dart';
import 'package:speak_live_go/core/constants/assets/settings_icons.dart';

enum SettingsEnum {
  changeEmail,
  changePassword,
  notifications,
  rateApp,
  clubRules,
  deleteAccount,
  faq,
}

extension SettingsEnumExtensions on SettingsEnum {
  String get getIcon {
    switch (this) {
      case SettingsEnum.changeEmail:
        return SettingIcons.changeEmail;
      case SettingsEnum.changePassword:
        return SettingIcons.changePassword;
      case SettingsEnum.notifications:
        return SettingIcons.notifications;
      case SettingsEnum.rateApp:
        return SettingIcons.rateApp;
      case SettingsEnum.clubRules:
        return SettingIcons.clubRules;
      case SettingsEnum.deleteAccount:
        return SettingIcons.deleteAccount;
      case SettingsEnum.faq:
        return SettingIcons.faq;
    }
  }

  String get getTitle {
    switch (this) {
      case SettingsEnum.changeEmail:
        return 'Change email';
      case SettingsEnum.changePassword:
        return 'Change password';
      case SettingsEnum.notifications:
        return 'Notifications';
      case SettingsEnum.rateApp:
        return 'Rate Speak Live Go';
      case SettingsEnum.clubRules:
        return 'Club rules';
      case SettingsEnum.deleteAccount:
        return 'Delete account';
      case SettingsEnum.faq:
        return 'FAQ';
    }
  }

  bool get hasToggle => this == SettingsEnum.notifications;
  bool get hasRating => this == SettingsEnum.rateApp;
  bool get showSubtitle => this == SettingsEnum.changeEmail;
}

