part of 'ranking_view_provider.dart';

class RankingViewState extends Equatable {
  const RankingViewState({
    this.rankers = const [],
    this.currentTab = RankingTabEnum.today,
  });

  RankingViewState copyWith({
    List<UserLightModel>? rankers,
    RankingTabEnum? currentTab,
  }) => RankingViewState(
    rankers: rankers ?? this.rankers,
    currentTab: currentTab ?? this.currentTab,
  );

  final List<UserLightModel> rankers;
  final RankingTabEnum currentTab;

  @override
  List<Object?> get props => [
    rankers,
    currentTab,
  ];
}
