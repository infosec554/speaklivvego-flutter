part of 'filter_provider.dart';

class FilterState extends Equatable {
  const FilterState({
    this.gender,
    this.levels = const [LevelEnum.a1],
    this.rating = const RangeValues(0, 100),
    this.levelRange = const RangeValues(0, 20),
  });

  FilterState copyWith({
    Nullable<GenderEnum?>? gender,
    List<LevelEnum>? levels,
    RangeValues? rating,
    RangeValues? levelRange,
  }) => FilterState(
    gender: gender == null ? this.gender : gender.value,
    levels: levels ?? this.levels,
    rating: rating ?? this.rating,
    levelRange: levelRange ?? this.levelRange,
  );

  final GenderEnum? gender;
  final List<LevelEnum> levels;
  final RangeValues rating;
  final RangeValues levelRange;

  @override
  List<Object?> get props => [
    gender,
    levels,
    rating,
    levelRange,
  ];
}
