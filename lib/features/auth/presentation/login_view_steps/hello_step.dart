import 'package:flutter/material.dart';
import 'package:speak_live_go/core/constants/assets/app_images.dart';
import 'package:speak_live_go/features/auth/presentation/widgets/step_skeleton.dart';
import 'package:speak_live_go/features/common/presentation/widgets/app_gap.dart';
import 'package:speak_live_go/features/common/presentation/widgets/buttons/app_tap.dart';
import 'package:speak_live_go/utils/extensions/build_context/text_styles.dart';
import 'package:speak_live_go/utils/extensions/string_extensions.dart';

class HelloStep extends StatelessWidget {
  const HelloStep({
    required this.email,
    required this.onUseAnotherEmail,
    required this.onCreateAccount,
    super.key,
  });

  final String email;
  final VoidCallback onUseAnotherEmail;
  final VoidCallback onCreateAccount;

  @override
  Widget build(BuildContext context) {
    return StepSkeleton(
      title: 'Sign up',
      continueButtonTitle: 'Create account',
      onContinue: onCreateAccount,
      children: [
        const HBox(60),
        AppImages.helloHand.toAssetImage(),
        const HBox(36),
        Text(
          email,
          style: context.c535353ColorTextStyle?.copyWith(
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        AppTap(
          onTap: onUseAnotherEmail,
          child: Text(
            'Use another email',
            style: context.c2A85F3primaryColorTextStyle?.copyWith(
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
          ),
        ),
        const Spacer(),
      ],
    );
  }
}
