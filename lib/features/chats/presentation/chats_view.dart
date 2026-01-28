import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:speak_live_go/core/constants/app_colors.dart';
import 'package:speak_live_go/core/constants/app_constants.dart';
import 'package:speak_live_go/core/constants/app_shadows.dart';
import 'package:speak_live_go/core/routing/app_router_points.dart';
import 'package:speak_live_go/features/chats/presentation/providers/chats/chats_provider.dart';
import 'package:speak_live_go/features/chats/presentation/widgets/chat_item.dart';
import 'package:speak_live_go/features/common/presentation/providers/app_serch_controller/app_search_controller_provider.dart';
import 'package:speak_live_go/features/common/presentation/widgets/app_app_bar.dart';
import 'package:speak_live_go/features/common/presentation/widgets/app_gap.dart';
import 'package:speak_live_go/features/common/presentation/widgets/app_slidable_tile.dart';
import 'package:speak_live_go/features/common/presentation/widgets/text_fields/app_search_field.dart';
import 'package:speak_live_go/features/lobby/domain/enums/action_of_user_enum.dart';

class ChatsView extends ConsumerWidget {
  const ChatsView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(chatsProvider);
    final notifier = ref.read(chatsProvider.notifier);

    return Scaffold(
      appBar: const AppAppBar(title: 'Chats'),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: AppSearchField(
              onChanged: (v) {
                ref.read(searchQueryProvider.notifier).setQuery(v);
              },
            ),
          ),
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.fromLTRB(
                20,
                20,
                20,
                AppConstants.avoidNavbarPadding,
              ),
              itemBuilder: (context, index) {
                final item = state.items[index];
                return Container(
                  decoration: BoxDecoration(
                    boxShadow: AppShadows.userCard,
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(
                      10,
                    ),
                  ),
                  child: AppSlideTile(
                    isInLobby: false,
                    id: item.id,
                    onAction: (ActionOfUserEnum p1) {},
                    child: ChatItem(
                      child: item,
                      onTap: () async {
                        await context.pushNamed(
                          AppRouterPoints.chatPage.name,
                          extra: item,
                        );
                      },
                    ),
                  ),
                );
              },
              separatorBuilder: (_, _) => const HBox(10),
              itemCount: state.items.length,
            ),
          ),
        ],
      ),
    );
  }
}
