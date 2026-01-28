import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:speak_live_go/core/constants/assets/app_icons.dart';
import 'package:speak_live_go/features/common/data/models/nullable/nullable.dart';
import 'package:speak_live_go/features/common/presentation/widgets/app_gap.dart';
import 'package:speak_live_go/features/common/presentation/widgets/app_slider.dart';
import 'package:speak_live_go/features/common/presentation/widgets/app_titled.dart';
import 'package:speak_live_go/features/common/presentation/widgets/bg_wrappers/app_sheet_bg_wrapper.dart';
import 'package:speak_live_go/features/common/presentation/widgets/buttons/app_button.dart';
import 'package:speak_live_go/features/initial_info/domain/enums/level_enum.dart';
import 'package:speak_live_go/features/lobby/presentation/providers/filter/filter_provider.dart';
import 'package:speak_live_go/features/lobby/presentation/providers/filter_sheet/filter_sheet_provider.dart';
import 'package:speak_live_go/features/lobby/presentation/widgets/sheets/filter/widgets/gender_tabs.dart';
import 'package:speak_live_go/features/lobby/presentation/widgets/sheets/filter/widgets/level_chart.dart';
import 'package:speak_live_go/utils/extensions/build_context/text_styles.dart';
import 'package:speak_live_go/utils/extensions/string_extensions.dart';

class FilterBottomSheet extends ConsumerStatefulWidget {
  const FilterBottomSheet({
    required this.initial,
    super.key,
  });

  final FilterState initial;

  @override
  ConsumerState<FilterBottomSheet> createState() => _FilterBottomSheetState();
}

class _FilterBottomSheetState extends ConsumerState<FilterBottomSheet> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(filterSheetProvider.notifier).updateState(widget.initial);
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(filterSheetProvider);
    final notifier = ref.read(filterSheetProvider.notifier);
    return AppSheetBgWrapper(
      title: 'Find a partner',
      children: [
        AppTitled(
          title: 'Gender',
          child: GenderTabs(
            current: state.gender,
            onChanged: (v) {
              notifier.updateState(
                state.copyWith(gender: Nullable(v)),
              );
            },
          ),
        ),
        const HBox(8),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            AppIcons.thumbsUp.toSvgAsset(),
            const WBox(4),
            Text(
              '''${state.rating.start.toInt()} - ${state.rating.end.toInt()}%''',
              style: context.c2A85F3primaryColorTextStyle,
            ),
          ],
        ),
        AppTitled(
          title: 'Rating',
          child: AppSlider(
            values: state.rating,
            onChanged: (RangeValues value) {
              notifier.updateState(state.copyWith(rating: value));
            },
          ),
        ),

        AppTitled(
          title: 'English level',
          child: Column(
            children: [
              LevelChart(
                flexes: LevelEnum.a1.mockFlexes,
                onChanged: notifier.levelChanged,
                currentLevels: state.levels,
              ),
              const HBox(48),
              AppSlider(
                values: state.levelRange,
                onChanged: notifier.levelSliderChanged,
              ),
            ],
          ),
        ),
        const HBox(16),
        AppButton(
          radius: 11,
          height: 36,
          onPressed: () {
            context.pop(state);
          },
          title: 'Apply',
        ),
      ],
    );
  }
}
