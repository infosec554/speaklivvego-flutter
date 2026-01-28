import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

part 'find_a_partner_state.dart';

final findAPartnerProvider =
    AutoDisposeNotifierProvider<FindAPartnerNotifier, FindAPartnerState>(
      FindAPartnerNotifier.new,
    );

class FindAPartnerNotifier extends AutoDisposeNotifier<FindAPartnerState> {
  Timer? timer;

  void updateState(FindAPartnerState v) {
    state = v;
  }

  void start() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      updateState(state.copyWith(duration: state.duration + 1));
    });
  }

  @override
  FindAPartnerState build() {
    ref.onDispose(() {
      timer?.cancel();
    });
    WidgetsBinding.instance.addPostFrameCallback((_) {
      start();
    });
    return const FindAPartnerState(
      duration: 0,
    );
  }
}
