import 'package:speak_live_go/core/constants/assets/app_images.dart';

enum ReasonEnum {
  speakBetter,
  makeFriends,
}

extension ReasonEnumExtension on ReasonEnum {
  String get getGreetingImage {
    switch (this) {
      case ReasonEnum.speakBetter:
        return AppImages.greetingSpeakBetter;
      case ReasonEnum.makeFriends:
        return AppImages.greetingMakeFriends;
    }
  }

  String get getIconOnTile {
    switch (this) {
      case ReasonEnum.speakBetter:
        return AppImages.reasonSpeakBetter;
      case ReasonEnum.makeFriends:
        return AppImages.reasonMakeFriends;
    }
  }

  String get getTitle {
    switch (this) {
      case ReasonEnum.speakBetter:
        return 'Speak Better';
      case ReasonEnum.makeFriends:
        return 'Make Friends';
    }
  }

  String get getDescription {
    switch (this) {
      case ReasonEnum.speakBetter:
        return 'Practice speaking and remember what you’ve learned';
      case ReasonEnum.makeFriends:
        return 'Build real connections with people worldwide.';
    }
  }

  String get getHowIsChoiceTitle {
    switch (this) {
      case ReasonEnum.speakBetter:
        return 'Great choice!';

      case ReasonEnum.makeFriends:
        return 'Awesome choice!';
    }
  }

  String get getWish1 {
    switch (this) {
      case ReasonEnum.speakBetter:
        return '''
Speaking clubs are the best place to practice your language and grow your knowledge.''';

      case ReasonEnum.makeFriends:
        return 'Connect with natives and unlock new opportunities.';
    }
  }

  String get getWish2 {
    switch (this) {
      case ReasonEnum.speakBetter:
        return 'Appname helps you practice freely and gain confidence.';

      case ReasonEnum.makeFriends:
        return '''
If you’re new to an English-speaking country, these friendships make it easier to fit in and succeed.''';
    }
  }
}
