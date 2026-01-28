import 'package:speak_live_go/core/constants/assets/app_icons.dart';

enum ActionOfUserEnum {
  toFriends,
  message,
  report,
  bloc,
}

extension ActionOfUserEnumExtensions on ActionOfUserEnum {
  bool get isToFriends => this == ActionOfUserEnum.toFriends;

  bool get isMessage => this == ActionOfUserEnum.message;

  bool get isReport => this == ActionOfUserEnum.report;

  bool get isBloc => this == ActionOfUserEnum.bloc;

  String get getIcon {
    switch (this) {
      case ActionOfUserEnum.toFriends:
        return AppIcons.heart;
      case ActionOfUserEnum.message:
        return AppIcons.message;
      case ActionOfUserEnum.report:
        return AppIcons.report;
      case ActionOfUserEnum.bloc:
        return AppIcons.bloc;
    }
  }

  String get getTitle {
    switch (this) {
      case ActionOfUserEnum.toFriends:
        return 'To friends';
      case ActionOfUserEnum.message:
        return 'Message';
      case ActionOfUserEnum.report:
        return 'Report';
      case ActionOfUserEnum.bloc:
        return 'Bloc';
    }
  }
}
