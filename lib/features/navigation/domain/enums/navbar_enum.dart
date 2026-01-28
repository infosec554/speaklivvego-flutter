import 'package:speak_live_go/core/constants/assets/app_icons.dart';

enum NavBarEnum {
  lobby,
  chat,
  rating,
  contacts,
  profile,
}

extension NavbarEnumExtension on NavBarEnum {
  String get getTitle {
    switch (this) {
      case NavBarEnum.lobby:
        return 'Lobby';
      case NavBarEnum.chat:
        return 'Chat';
      case NavBarEnum.rating:
        return 'Rating';
      case NavBarEnum.contacts:
        return 'Contacts';
      case NavBarEnum.profile:
        return 'Profile';
    }
  }

  String get getIcon {
    switch (this) {
      case NavBarEnum.lobby:
        return AppIcons.navBarHome;
      case NavBarEnum.chat:
        return AppIcons.navBarChat;
      case NavBarEnum.rating:
        return AppIcons.navBarRating;
      case NavBarEnum.contacts:
        return AppIcons.navBarContacts;
      case NavBarEnum.profile:
        return AppIcons.navBarProfile;
    }
  }
}
