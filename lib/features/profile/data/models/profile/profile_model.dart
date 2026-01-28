import 'package:equatable/equatable.dart';
import 'package:speak_live_go/features/initial_info/data/models/language/language_model.dart';
import 'package:speak_live_go/features/initial_info/domain/enums/gender_enum.dart';
import 'package:speak_live_go/features/initial_info/domain/enums/level_enum.dart';
import 'package:speak_live_go/features/profile/domain/enums/private_info_enum.dart';

class ProfileModel extends Equatable {
  const ProfileModel({
    required this.name,
    required this.level,
    required this.avatar,
    required this.feedBackCount,
    required this.talkCount,
    required this.talkHours,
    required this.gender,
    required this.age,
    required this.localTime,
    required this.interests,
    required this.nativeLanguage,
    required this.countryName,
  });

  final String name;
  final LevelEnum level;
  final String? avatar;
  final int feedBackCount;
  final int talkCount;
  final double talkHours;
  final LanguageModel nativeLanguage;
  final GenderEnum gender;
  final int age;
  final String localTime;
  final String countryName;
  final List<String> interests;

  @override
  List<Object?> get props => [
    name,
    level,
    avatar,
    feedBackCount,
    talkCount,
    talkHours,
    countryName,
    gender,
    age,
    localTime,
    interests,
    nativeLanguage,
  ];

  static ProfileModel getMock(int index) {
    return ProfileModel(
      countryName: 'Country name $index',
      name: 'Name $index',
      level: LevelEnum.a2,
      avatar: null,
      feedBackCount: 12,
      talkCount: 23,
      talkHours: 32,
      gender: GenderEnum.male,
      age: 21,
      localTime: '12:32',
      interests: const ['Boxing', 'Programming'],
      nativeLanguage: LanguageModel(id: index, name: '$index language'),
    );
  }

  String getInfoByEnum(PrivateInfoEnum v) {
    switch (v) {
      case PrivateInfoEnum.nativeLanguage:
        return nativeLanguage.name;
      case PrivateInfoEnum.englishLevel:
        return level.getTitle;
      case PrivateInfoEnum.gender:
        return gender.getTitle;
      case PrivateInfoEnum.age:
        return '$age years old';
      case PrivateInfoEnum.location:
        return countryName;
      case PrivateInfoEnum.localTime:
        return localTime;
    }
  }
}
