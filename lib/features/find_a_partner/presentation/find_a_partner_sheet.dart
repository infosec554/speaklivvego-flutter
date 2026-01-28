import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:speak_live_go/core/constants/app_colors.dart';
import 'package:speak_live_go/core/constants/assets/app_icons.dart';
import 'package:speak_live_go/features/common/presentation/widgets/app_gap.dart';
import 'package:speak_live_go/features/common/presentation/widgets/bg_wrappers/app_full_screen_sheet_wrapper.dart';
import 'package:speak_live_go/features/common/presentation/widgets/buttons/app_tap.dart';
import 'package:speak_live_go/features/find_a_partner/presentation/providers/find_a_partner/find_a_partner_provider.dart';
import 'package:speak_live_go/features/find_a_partner/presentation/widgets/waiting_call_spinner.dart';
import 'package:speak_live_go/features/lobby/presentation/providers/filter/filter_provider.dart';
import 'package:speak_live_go/features/lobby/presentation/widgets/sheets/filter/filter_bottom_sheet.dart';
import 'package:speak_live_go/utils/extensions/build_context/show_modal_bottom_sheet_extension.dart';
import 'package:speak_live_go/utils/extensions/build_context/text_styles.dart';
import 'package:speak_live_go/utils/extensions/int_extensions.dart';
import 'package:speak_live_go/utils/extensions/string_extensions.dart';

class FindAPartnerSheet extends ConsumerWidget {
  const FindAPartnerSheet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(findAPartnerProvider);
    final notifier = ref.read(findAPartnerProvider.notifier);
    final filterState = ref.watch(filterProvider);
    return AppFullScreenSheetWrapper(
      title: 'Find a partner',
      children: [
        Text(
          'Looking for\nthe perfect partner',
          textAlign: TextAlign.center,
          style: context.cBlackColorTextStyle?.copyWith(
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
        ),
        const HBox(20),
        WaitCallSpinner(
          waitingTime: state.duration.toHHMMSS,
        ),
        const HBox(20),
        Text(
          'Don’t lock the screen  or exit the app\nduring the search',
          textAlign: TextAlign.center,
          style: context.cBlackColorTextStyle?.copyWith(
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
        const HBox(24),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppTap(
              onTap: () async {
                final result = await context.showModalSheet<FilterState>(
                  content: FilterBottomSheet(initial: filterState),
                );
                if (result != null) {
                  ref.read(filterProvider.notifier).updateState(result);
                }
              },
              child: Row(
                children: [
                  AppIcons.filter.toSvgAsset(
                    color: AppColors.c2A85F3primary,
                  ),
                  const WBox(6),
                  Text(
                    'Search settings',
                    style: context.c2A85F3primaryColorTextStyle,
                  ),
                ],
              ),
            ),
          ],
        ),
        const HBox(90),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppTap(
              onTap: () {
                context.pop();
              },
              child: Container(
                height: 35,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: AppColors.cD9D9D9,
                ),
                alignment: Alignment.center,
                child: Text(
                  'Cancel the search',
                  style: context.cBlackColorTextStyle?.copyWith(
                    fontWeight: FontWeight.w500,
                    fontSize: 13,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
