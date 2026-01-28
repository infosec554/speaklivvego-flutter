import 'package:flutter/material.dart';
import 'package:speak_live_go/features/common/presentation/widgets/app_gap.dart';
import 'package:speak_live_go/features/common/presentation/widgets/app_texts/text_20_600.dart';

class AppTitled extends StatelessWidget {
  const AppTitled({
    required this.title,
    required this.child,
    super.key,
  });

  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText20W600Black(title),
        const HBox(20),
        child,
      ],
    );
  }
}
