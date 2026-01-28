import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:speak_live_go/core/constants/app_colors.dart';
import 'package:speak_live_go/features/common/presentation/widgets/app_gap.dart';
import 'package:speak_live_go/features/common/presentation/widgets/app_radio_tile.dart';
import 'package:speak_live_go/features/common/presentation/widgets/bg_wrappers/app_sheet_bg_wrapper.dart';
import 'package:speak_live_go/features/common/presentation/widgets/buttons/app_button.dart';
import 'package:speak_live_go/features/lobby/presentation/providers/report_the_user/report_the_user_provider.dart';

class ReportTheUserSheet extends ConsumerWidget {
  const ReportTheUserSheet({super.key});

  static const List<String> reasons = [
    'Inappropriate photo',
    'Offensive/rude nickname',
    'Other',
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: const BorderSide(
        width: 2,
        color: AppColors.c2A85F3primary,
      ),
    );
    final state = ref.watch(reportTheUserProvider);
    final notifier = ref.read(reportTheUserProvider.notifier);
    return AppSheetBgWrapper(
      title: 'Report the user',
      children: [
        for (final v in reasons)
          AppRadioTile(
            active: state.selectedReasons.contains(v),
            onTap: () {
              notifier.onChooseReport(v);
            },
            title: v,
            padding: const EdgeInsets.fromLTRB(
              0,
              12,
              10,
              12,
            ),
          ),
        const HBox(24),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: TextField(
            onChanged: (v) {
              notifier.updateState(state.copyWith(report: v));
            },
            maxLines: 4,
            decoration: InputDecoration(
              enabledBorder: border,
              border: border,
              focusedBorder: border,
              hintText: 'Describe the report',
            ),
          ),
        ),
        const HBox(16),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: AppButton(
            title: 'Send report',
            onPressed: state.canReport
                ? () => notifier.report(
                    onSuccess: () {
                      context.pop();
                    },
                  )
                : null,
          ),
        ),
      ],
    );
  }
}
