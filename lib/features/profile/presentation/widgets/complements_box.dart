import 'package:flutter/material.dart';
import 'package:speak_live_go/core/constants/app_colors.dart';
import 'package:speak_live_go/features/common/presentation/widgets/app_gap.dart';
import 'package:speak_live_go/features/common/presentation/widgets/app_texts/text_20_600.dart';
import 'package:speak_live_go/features/profile/presentation/widgets/profile_box_bg.dart';
import 'package:speak_live_go/utils/extensions/build_context/text_styles.dart';

class ComplementsBox extends StatelessWidget {
  const ComplementsBox({super.key});

  @override
  Widget build(BuildContext context) {
    return ProfileBoxBg(
      title: 'Complements',
      padding: const EdgeInsets.all(16),
      children: [
        for (int i = 0; i < 7; i++) ...[
          _W(count: i, text: 'Great speaking parner'),
          const HBox(15),
        ],
        const HBox(30),
        const AppText20W600Black('Advice'),
        const HBox(10),
        for (int i = 0; i < 7; i++) ...[
          _W(count: i, text: 'Great speaking parner'),
          const HBox(15),
        ],
      ],
    );
  }
}

class _W extends StatelessWidget {
  const _W({super.key, required this.text, required this.count});

  final String text;
  final int count;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 40,
          width: 40,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: AppColors.cD9D9D9,
          ),
          child: Text(
            count.toString(),
            style: context.c696969ColorTextStyle?.copyWith(
              fontSize: 16,
            ),
          ),
        ),
        const WBox(16),
        Expanded(
          child: Text(
            text,
            style: context.c696969ColorTextStyle?.copyWith(
              fontSize: 16,
            ),
          ),
        ),
      ],
    );
  }
}
