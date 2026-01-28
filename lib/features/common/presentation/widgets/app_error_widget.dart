import 'package:flutter/material.dart';

export 'app_loading_widget.dart';

class AppErrorWidget extends StatelessWidget {
  const AppErrorWidget(this.error, {super.key});

  final Object? error;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        error.toString(),
      ),
    );
  }
}
