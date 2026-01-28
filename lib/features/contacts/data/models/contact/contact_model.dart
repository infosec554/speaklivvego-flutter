import 'package:equatable/equatable.dart';
import 'package:speak_live_go/features/initial_info/domain/enums/gender_enum.dart';
import 'package:speak_live_go/features/initial_info/domain/enums/level_enum.dart';

class ContactModel extends Equatable {
  const ContactModel({
    required this.gender,
    required this.name,
    required this.rating,
    required this.level,
    required this.isOnline,
    required this.country,
    required this.talkCount,
    required this.id,
    required this.callDate,
    required this.isBlocked,
  });

  final GenderEnum gender;
  final String name;
  final String country;
  final int talkCount;
  final double rating;
  final LevelEnum level;
  final bool isOnline;
  final int id;
  final DateTime callDate;
  final bool isBlocked;

  @override
  List<Object?> get props => [
    gender,
    name,
    id,
    rating,
    level,
    isBlocked,
    isOnline,
    callDate,
  ];

  static ContactModel getMock(
    int index, {
    bool isBlocked = false,
  }) => ContactModel(
    gender: GenderEnum.male,
    name: 'Name $index',
    rating: 95,
    level: index.isEven ? LevelEnum.a2 : LevelEnum.c2,
    isOnline: index.isEven,
    country: 'Uzbekistan',
    talkCount: index * 10,
    id: index,
    callDate: DateTime.now(),
    isBlocked: isBlocked,
  );
}
