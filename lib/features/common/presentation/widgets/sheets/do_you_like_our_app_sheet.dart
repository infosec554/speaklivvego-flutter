import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:speak_live_go/core/constants/app_colors.dart';
import 'package:speak_live_go/features/common/presentation/widgets/app_gap.dart';
import 'package:speak_live_go/features/common/presentation/widgets/bg_wrappers/app_sheet_bg_wrapper.dart';
import 'package:speak_live_go/features/common/presentation/widgets/buttons/app_button.dart';
import 'package:speak_live_go/features/common/presentation/widgets/buttons/app_tap.dart';
import 'package:speak_live_go/utils/extensions/build_context/text_styles.dart';

class DoYouLikeOurAppSheet extends StatelessWidget {
  const DoYouLikeOurAppSheet({
    this.onILike,
    this.onNotReally,
    super.key,
  });

  final VoidCallback? onILike;
  final VoidCallback? onNotReally;

  @override
  Widget build(BuildContext context) {
    return AppSheetBgWrapper(
      title: '',
      children: [
        // Red heart emoji
        Container(
          height: 100,
          width: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
          ),
          child: Center(
            child: Text(
              '❤️',
              style: const TextStyle(fontSize: 80),
            ),
          ),
        ),
        const HBox(24),
        // Question text
        Text(
          'Do you like our app?',
          textAlign: TextAlign.center,
          style: context.cBlackColorTextStyle?.copyWith(
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
        ),
        const HBox(32),
        // "I like" button
        AppButton(
          title: 'I like',
          onPressed: onILike ??
              () {
                // TODO: Handle positive feedback
                context.pop();
              },
        ),
        const HBox(16),
        // "Not really" text link
        AppTap(
          onTap: onNotReally ??
              () {
                // TODO: Handle negative feedback
                context.pop();
              },
          child: Text(
            'Not really',
            textAlign: TextAlign.center,
            style: context.c2A85F3primaryColorTextStyle?.copyWith(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}

