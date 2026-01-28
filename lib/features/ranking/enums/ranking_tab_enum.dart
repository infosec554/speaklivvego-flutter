enum RankingTabEnum {
  today,
  week,
  month,
}

extension RankingTabEnumExtensions on RankingTabEnum {
  String get toDisplay {
    switch (this) {
      case RankingTabEnum.today:
        return 'Today';
      case RankingTabEnum.week:
        return 'Week';
      case RankingTabEnum.month:
        return 'Month';
    }
  }

  bool get isToday => RankingTabEnum.today == this;

  bool get isWeek => RankingTabEnum.week == this;

  bool get isMonth => RankingTabEnum.month == this;
}
