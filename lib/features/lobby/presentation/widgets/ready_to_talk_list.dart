import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:speak_live_go/utils/extensions/build_context/text_styles.dart';
import 'package:speak_live_go/features/common/presentation/widgets/app_loading_widget.dart';
import 'package:speak_live_go/features/common/presentation/widgets/buttons/app_refresh_button.dart';
import 'package:speak_live_go/features/lobby/presentation/providers/ready_to_talk_list/ready_to_talk_list_provider.dart';
import 'package:speak_live_go/features/lobby/presentation/widgets/user_card.dart';

class ReadyToTalkList extends ConsumerWidget {
  const ReadyToTalkList({
    required this.onRefresh,
    super.key,
  });

  final VoidCallback? onRefresh;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(readyToTalkListProvider);
    return SizedBox(
      height: 338,
      width: double.maxFinite,
      child: Stack(
        children: [
          Positioned.fill(
            child: state.when(
              data: (data) {
                return ListView.separated(
                  padding: const EdgeInsets.fromLTRB(16, 36, 16, 68),

                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    final user = data[index];
                    return UserCard(user: user);
                  },
                  separatorBuilder: (context, index) =>
                      const SizedBox(width: 16),
                  itemCount: data.length,
                );
              },
              error: (error, stackTrace) {
                return AppErrorWidget(error);
              },
              loading: () => const AppLoading(),
            ),
          ),
          Positioned(
            left: 10,
            top: 0,
            child: Text(
              'Ready to talk now',
              style: context.cBlackColorTextStyle?.copyWith(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Positioned(
            left: 10,
            bottom: 8,
            right: 10,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Invite online partners',
                  style: context.cBlackColorTextStyle?.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Spacer(
                  flex: 4,
                ),
                Expanded(
                  flex: 7,
                  child: AppRefreshButton(
                    onPressed: onRefresh,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
