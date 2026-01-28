import 'package:equatable/equatable.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:speak_live_go/features/lobby/data/models/user_light/user_light_model.dart';
import 'package:speak_live_go/features/ranking/enums/ranking_tab_enum.dart';

part 'ranking_view_state.dart';

final rankingViewProvider =
    AutoDisposeNotifierProvider<RankingViewNotifier, RankingViewState>(
      RankingViewNotifier.new,
    );

class RankingViewNotifier extends AutoDisposeNotifier<RankingViewState> {
  void updateState(RankingViewState v) {
    state = v;
  }

  @override
  RankingViewState build() {
    return RankingViewState(rankers: List.generate(12, UserLightModel.getMock));
  }
}
