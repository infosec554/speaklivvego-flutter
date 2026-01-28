import 'package:flutter/material.dart';
import 'package:speak_live_go/utils/extensions/build_context/text_styles.dart';
import 'package:speak_live_go/utils/extensions/string_extensions.dart';
import 'package:speak_live_go/features/common/presentation/widgets/app_gap.dart';
import 'package:speak_live_go/features/common/presentation/widgets/buttons/app_button.dart';
import 'package:speak_live_go/features/initial_info/domain/enums/reason_enum.dart';

class GreetingStep extends StatelessWidget {
  const GreetingStep({
    required this.reason,
    required this.onContinue,
    super.key,
  });

  final ReasonEnum reason;
  final VoidCallback onContinue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const HBox(46),
            reason.getGreetingImage.toAssetImage(),
            const HBox(36),
            Text(
              reason.getHowIsChoiceTitle,
              textAlign: TextAlign.center,
              style: context.cBlackColorTextStyle?.copyWith(
                fontWeight: FontWeight.w600,
                fontSize: 20,
              ),
            ),
            const HBox(16),
            Text(
              reason.getWish1,

              textAlign: TextAlign.center,
              style: context.cBlackColorTextStyle?.copyWith(
                fontSize: 18,
              ),
            ),
            const HBox(12),
            Text(
              reason.getWish2,

              textAlign: TextAlign.center,
              style: context.cBlackColorTextStyle?.copyWith(
                fontSize: 18,
              ),
            ),
            const Spacer(),
            AppButton(
              title: 'Continue',
              onPressed: onContinue,
            ),
          ],
        ),
      ),
    );
  }
}
