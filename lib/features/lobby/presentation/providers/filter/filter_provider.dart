import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:speak_live_go/features/common/data/models/nullable/nullable.dart';
import 'package:speak_live_go/features/initial_info/domain/enums/gender_enum.dart';
import 'package:speak_live_go/features/initial_info/domain/enums/level_enum.dart';

part 'filter_state.dart';

final filterProvider = AutoDisposeNotifierProvider<FilterNotifier, FilterState>(
  FilterNotifier.new,
);

class FilterNotifier extends AutoDisposeNotifier<FilterState> {
  void updateState(FilterState v) {
    state = v;
  }

  @override
  FilterState build() {
    return const FilterState();
  }
}
