import 'package:equatable/equatable.dart';
import 'package:speak_live_go/features/initial_info/domain/enums/gender_enum.dart';
import 'package:speak_live_go/features/initial_info/domain/enums/level_enum.dart';

class UserLightModel extends Equatable {
  const UserLightModel({
    required this.gender,
    required this.name,
    required this.rating,
    required this.level,
    required this.isOnline,
    required this.country,
    required this.talkCount,
    required this.id,
  });

  final GenderEnum gender;
  final String name;
  final String country;
  final int talkCount;
  final double rating;
  final LevelEnum level;
  final bool isOnline;
  final int id;

  @override
  List<Object?> get props => [gender, name, id, rating, level, isOnline];

  static UserLightModel getMock(int index) => UserLightModel(
    gender: GenderEnum.male,
    name: 'Name $index',
    rating: 95,
    level: index.isEven ? LevelEnum.a2 : LevelEnum.c2,
    isOnline: index.isEven,
    country: 'Uzbekistan',
    talkCount: index * 10,
    id: index ,
  );
}
