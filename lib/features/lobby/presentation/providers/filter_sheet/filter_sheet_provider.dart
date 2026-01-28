import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:speak_live_go/utils/extensions/range_value_extensions.dart';
import 'package:speak_live_go/features/initial_info/domain/enums/level_enum.dart';
import 'package:speak_live_go/features/lobby/presentation/providers/filter/filter_provider.dart';

final filterSheetProvider =
    AutoDisposeNotifierProvider<FilterSheetNotifier, FilterState>(
      FilterSheetNotifier.new,
    );

class FilterSheetNotifier extends AutoDisposeNotifier<FilterState> {
  void updateState(FilterState v) {
    state = v;
  }

  @override
  FilterState build() {
    return const FilterState();
  }

  void levelSliderChanged(RangeValues v) {
    updateState(
      state.copyWith(
        levels: v.getLevels,
        levelRange: v,
      ),
    );
  }

  Future<void> levelChanged(LevelEnum v) async {
    RangeValues? range;
    final temp = [...state.levels];
    if (temp.isEmpty) {
      range = v.toRange;
    } else if (temp.length == 1) {
      final actual = temp.single;
      if (v == actual) {
      } else if (actual.index < v.index) {
        final s = actual.toDouble;
        final e = v.toDouble;
        range = RangeValues(s, e);
      } else {
        final s = v.toDouble;
        final e = actual.toDouble;
        range = RangeValues(s, e);
      }
    } else {
      range = v.toRange;
    }
    if (range != null) {
      levelSliderChanged(range);
    } else {
      await EasyLoading.showSuccess(v.toString());
    }
  }
}
