import 'package:flutter/material.dart';

extension ShowModalBottomSheetExtension on BuildContext {
  Future<T?> showModalSheet<T>({
    required Widget content,
  }) async {
    final result = await showModalBottomSheet<T>(
      useRootNavigator: true,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      context: this,
      builder: (context) {
        return content;
      },
    );
    return result;
  }
}
