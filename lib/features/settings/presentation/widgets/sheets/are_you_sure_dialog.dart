import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:speak_live_go/features/common/presentation/widgets/app_gap.dart';
import 'package:speak_live_go/features/common/presentation/widgets/bg_wrappers/app_sheet_bg_wrapper.dart';
import 'package:speak_live_go/features/common/presentation/widgets/buttons/app_danger_button.dart';
import 'package:speak_live_go/features/common/presentation/widgets/buttons/app_secondary_button.dart';
import 'package:speak_live_go/utils/extensions/build_context/text_styles.dart';

class AreYouSureDialog extends StatelessWidget {
  const AreYouSureDialog({
    required this.question,
    required this.submitButtonTitle,
    required this.warning,
    super.key,
  });

  final String question;
  final String warning;
  final String submitButtonTitle;

  @override
  Widget build(BuildContext context) {
    return AppSheetBgWrapper(
      title: '😱',titleSize: 64,


      children: [
        Text(
          question,
          textAlign: TextAlign.center,
          style: context.cBlackColorTextStyle?.copyWith(
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
        ),
        Text(
          warning,
          textAlign: TextAlign.center,
          style: context.c696969ColorTextStyle?.copyWith(
            fontSize: 12,
          ),
        ),
        const HBox(20),
        AppDangerButton(
          title: submitButtonTitle,
          onPressed: () {
            context.pop(true);
          },
        ),
        // const HBox(20),
        AppSecondaryButton(
          height: 42,
          title: 'Cancel',
          onPressed: () {
            context.pop(false);
          },
        ),
      ],
    );
  }
}
