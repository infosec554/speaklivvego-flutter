import 'package:flutter/material.dart';

enum LevelEnum {
  a1,
  a2,
  b1,
  b2,
  c1,
  c2,
}

extension LevelEnumExtensions on LevelEnum {
  /// remove when production
  Map<LevelEnum, int> get mockFlexes => {
    LevelEnum.a1: 50,
    LevelEnum.a2: 22,
    LevelEnum.b1: 59,
    LevelEnum.b2: 100,
    LevelEnum.c1: 90,
    LevelEnum.c2: 10,
  };

  String get getTitle {
    switch (this) {
      case LevelEnum.a1:
        return 'A1 - Beginner';
      case LevelEnum.a2:
        return 'A2 - Elementary';
      case LevelEnum.b1:
        return 'B1 - Intermediate';
      case LevelEnum.b2:
        return 'B2 - Upper-Intermediate';
      case LevelEnum.c1:
        return 'C1 - Advanced';
      case LevelEnum.c2:
        return 'C2 - Proficient';
    }
  }

  String get getShortTitle {
    switch (this) {
      case LevelEnum.a1:
        return 'A1';
      case LevelEnum.a2:
        return 'A2';
      case LevelEnum.b1:
        return 'B1';
      case LevelEnum.b2:
        return 'B2';
      case LevelEnum.c1:
        return 'C1';
      case LevelEnum.c2:
        return 'C2';
    }
  }

  String get getDescription {
    switch (this) {
      case LevelEnum.a1:
        return '''
I can introduce myself and use simple greetings. I can ask and answer very basic questions.''';
      case LevelEnum.a2:
        return '''
I can talk about everyday life and describe familiar places. I can manage short conversations.''';
      case LevelEnum.b1:
        return '''
I can talk about my hobbies and share travel experiences. I can keep a conversation going smoothly.''';
      case LevelEnum.b2:
        return '''
I can discuss movies and current topics. I can share opinions clearly and use common idioms.''';
      case LevelEnum.c1:
        return '''
I can tell detailed stories and explain complex ideas. I have a very strong command of English.''';
      case LevelEnum.c2:
        return '''
I can express myself effortlessly and precisely, even on complex or abstract topics. I can adapt my language style to suit different audiences and purposes. My command of English allows me to convey subtle shades of meaning and maintain a natural, fluent flow in both spoken and written communication.''';
    }
  }

  double get toDouble {
    switch (this) {
      case LevelEnum.a1:
        return 0;
      case LevelEnum.a2:
        return 20;
      case LevelEnum.b1:
        return 40;
      case LevelEnum.b2:
        return 60;
      case LevelEnum.c1:
        return 80;
      case LevelEnum.c2:
        return 100;
    }
  }

  RangeValues get toRange {
    switch (this) {
      case LevelEnum.a1:
        return const RangeValues(0, 10);
      case LevelEnum.a2:
        return const RangeValues(11, 30);
      case LevelEnum.b1:
        return const RangeValues(31, 50);
      case LevelEnum.b2:
        return const RangeValues(51, 70);
      case LevelEnum.c1:
        return const RangeValues(71, 90);
      case LevelEnum.c2:
        return const RangeValues(91, 100);
    }
  }
}
