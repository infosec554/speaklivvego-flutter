import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:speak_live_go/features/common/presentation/widgets/app_gap.dart';
import 'package:speak_live_go/features/common/presentation/widgets/app_slidable_tile.dart';
import 'package:speak_live_go/features/find_a_partner/presentation/find_a_partner_sheet.dart';
import 'package:speak_live_go/features/lobby/data/models/user_light/user_light_model.dart';
import 'package:speak_live_go/features/lobby/domain/enums/action_of_user_enum.dart';
import 'package:speak_live_go/features/lobby/domain/enums/call_button_type_enum.dart';
import 'package:speak_live_go/features/lobby/presentation/providers/filter/filter_provider.dart';
import 'package:speak_live_go/features/lobby/presentation/widgets/app_bar_of_lobby_view.dart';
import 'package:speak_live_go/features/lobby/presentation/widgets/find_partner_button.dart';
import 'package:speak_live_go/features/lobby/presentation/widgets/ready_to_talk_list.dart';
import 'package:speak_live_go/features/lobby/presentation/widgets/sheets/are_you_sure_to_block/are_you_sure_to_block_sheet.dart';
import 'package:speak_live_go/features/lobby/presentation/widgets/sheets/filter/filter_bottom_sheet.dart';
import 'package:speak_live_go/features/lobby/presentation/widgets/sheets/report_the_user/report_the_user_sheet.dart';
import 'package:speak_live_go/features/lobby/presentation/widgets/user_tile.dart';
import 'package:speak_live_go/utils/extensions/build_context/show_modal_bottom_sheet_extension.dart';

class LobbyView extends ConsumerStatefulWidget {
  const LobbyView({super.key});

  @override
  ConsumerState<LobbyView> createState() => _LobbyViewState();
}

class _LobbyViewState extends ConsumerState<LobbyView> {
  @override
  Widget build(BuildContext context) {
    final items = List.generate(12, UserLightModel.getMock);
    final filter = ref.watch(filterProvider);

    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FindPartnerButton(
        onPressed: () async {
          await context.showModalSheet<void>(
            content: const FindAPartnerSheet(),
          );
        },
      ),
      appBar: AppBarOfLobbyView(
        onFilter: () async {
          final result = await context.showModalSheet<FilterState>(
            content: FilterBottomSheet(initial: filter),
          );
          if (result != null) {
            ref.read(filterProvider.notifier).updateState(result);
          }
        },
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: ReadyToTalkList(
              onRefresh: () {},
            ),
          ),

          SlidableAutoCloseBehavior(
            child: SliverList.separated(
              itemCount: items.length,
              itemBuilder: (context, index) {
                final item = items[index];
                return AppSlideTile(
                  id: item.id,
                  onAction: (ActionOfUserEnum p1) async {
                    switch (p1) {
                      case ActionOfUserEnum.toFriends:
                        break;
                      case ActionOfUserEnum.message:
                        break;
                      case ActionOfUserEnum.report:
                        {
                          await context.showModalSheet<void>(
                            content: const ReportTheUserSheet(),
                          );
                          break;
                        }

                      case ActionOfUserEnum.bloc:
                        {
                          await context.showModalSheet<void>(
                            content: AreYouSureToBlockSheet(
                              userName: item.name,
                            ),
                          );
                          break;
                        }
                    }
                  },
                  child: UserTile(
                    item: items[index],
                    onTap: () {},
                    onCall: () {},
                    type: index == 2
                        ? CallButtonTypeEnum.callGreen
                        : (index.isEven
                              ? CallButtonTypeEnum.message
                              : CallButtonTypeEnum.call),
                  ),
                );
              },
              separatorBuilder: (context, index) => const HBox(16),
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 100)),
        ],
      ),
    );
  }
}
