import 'dart:ui';

import 'package:equatable/equatable.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

part 'report_the_user_state.dart';

final reportTheUserProvider =
    AutoDisposeNotifierProvider<ReportTheUserNotifier, ReportTheUserState>(
      ReportTheUserNotifier.new,
    );

class ReportTheUserNotifier extends AutoDisposeNotifier<ReportTheUserState> {
  void updateState(ReportTheUserState v) {
    state = v;
  }

  @override
  ReportTheUserState build() {
    return const ReportTheUserState();
  }

  void onChooseReport(String v) {
    final temp = [...state.selectedReasons];
    if (temp.contains(v)) {
      temp.remove(v);
    } else {
      temp.add(v);
    }
    updateState(state.copyWith(selectedReasons: temp));
  }

  Future<void> report({
    required VoidCallback onSuccess,
  }) async {
    onSuccess.call();
  }
}
