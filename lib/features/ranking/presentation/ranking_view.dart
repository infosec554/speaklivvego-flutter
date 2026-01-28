import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:speak_live_go/features/common/presentation/widgets/app_app_bar.dart';
import 'package:speak_live_go/features/ranking/presentation/ranking_view/ranking_view_provider.dart';
import 'package:speak_live_go/features/ranking/presentation/widgets/high_light_card.dart';
import 'package:speak_live_go/features/ranking/presentation/widgets/rankers.dart';
import 'package:speak_live_go/features/ranking/presentation/widgets/ranking_tabs.dart';

class RankingView extends ConsumerWidget {
  const RankingView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(rankingViewProvider);
    final notifier = ref.read(rankingViewProvider.notifier);
    return Scaffold(
      extendBody: true,
      appBar: AppAppBar(
        title: 'Most activate users',
        bottom: RankingTabs(
          current: state.currentTab,
          onChanged: (value) {
            notifier.updateState(state.copyWith(currentTab: value));
          },
        ),
        addToHeight: 56,
      ),
      body: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                children: [
                  SizedBox(height: 16),

                  HighLightCard(),

                  SizedBox(height: 16),
                ],
              ),
            ),
          ),

          SliverToBoxAdapter(
            child: Rankers(
              items: state.rankers,
            ),
          ),
        ],
      ),
    );
  }
}
