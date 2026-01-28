enum TabOfContactsEnum {
  calls,
  friends,
  blocked,
}

extension TabOfContactsEnumExtensions on TabOfContactsEnum {
  String get toDisplay {
    switch (this) {
      case TabOfContactsEnum.calls:
        return 'Calls';
      case TabOfContactsEnum.friends:
        return 'Friends';
      case TabOfContactsEnum.blocked:
        return 'Blocked';
    }
  }
}
