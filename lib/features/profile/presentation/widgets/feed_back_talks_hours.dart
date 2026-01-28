import 'package:flutter/material.dart';
import 'package:speak_live_go/core/constants/assets/app_icons.dart';
import 'package:speak_live_go/features/common/presentation/widgets/app_gap.dart';
import 'package:speak_live_go/utils/extensions/build_context/text_styles.dart';
import 'package:speak_live_go/utils/extensions/string_extensions.dart';

class FeedBackTalksHours extends StatelessWidget {
  const FeedBackTalksHours({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _W(
          title: 'Feedback',
          number: 0,
        ),
        _W(
          title: 'Talks',
          number: 0,
          icon: AppIcons.callGrey,
        ),
        _W(
          title: 'Hours',
          number: 0,
          icon: AppIcons.clock,
        ),
      ],
    );
  }
}

class _W extends StatelessWidget {
  const _W({
    super.key,
    this.icon,
    required this.title,
    required this.number,
  });

  final String? icon;
  final String title;
  final num number;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Builder(
          builder: (context) {
            if (icon == null) {
              return const WBox(16);
            }
            return icon!.toSvgAsset();
          },
        ),
        const WBox(8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: context.c696969ColorTextStyle,
            ),
            Text(
              number.toString(),
              style: context.c696969ColorTextStyle?.copyWith(
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
