import 'package:flutter/material.dart';
import 'package:speak_live_go/features/auth/presentation/widgets/step_skeleton.dart';
import 'package:speak_live_go/features/common/presentation/widgets/app_gap.dart';
import 'package:speak_live_go/features/common/presentation/widgets/text_fields/app_password_field.dart';

class CreatePasswordStep extends StatelessWidget {
  const CreatePasswordStep({
    required this.onBack,
    required this.onContinue,
    required this.passwordController,
    super.key,
  });

  final VoidCallback onBack;
  final VoidCallback? onContinue;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return StepSkeleton(
      onBackPressed: onBack,
      title: 'Create password',
      onContinue: onContinue,
      children: [
        const HBox(4),
        AppPasswordField(controller: passwordController),
        const Spacer(),
      ],
    );
  }
}
