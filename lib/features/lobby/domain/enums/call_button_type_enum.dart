import 'dart:ui';

import 'package:speak_live_go/core/constants/app_colors.dart';
import 'package:speak_live_go/core/constants/assets/app_icons.dart';

enum CallButtonTypeEnum {
  message,
  call,
  callGreen,
}

extension CallButtonTypeEnumExtensions on CallButtonTypeEnum {
  String get getIcon {
    switch (this) {
      case CallButtonTypeEnum.message:
        return AppIcons.chatBubble;
      case CallButtonTypeEnum.call:
        return AppIcons.call;
      case CallButtonTypeEnum.callGreen:
        return AppIcons.call;
    }
  }

  String get getTitle {
    switch (this) {
      case CallButtonTypeEnum.message:
        return 'Message';
      case CallButtonTypeEnum.call:
        return 'Call';
      case CallButtonTypeEnum.callGreen:
        return 'Call';
    }
  }

  Color get getBgColor {
    switch (this) {
      case CallButtonTypeEnum.message:
        return AppColors.c2A85F3primary;
      case CallButtonTypeEnum.call:
        return AppColors.c2A85F3primary;
      case CallButtonTypeEnum.callGreen:
        return AppColors.c42BB55green;
    }
  }
}
