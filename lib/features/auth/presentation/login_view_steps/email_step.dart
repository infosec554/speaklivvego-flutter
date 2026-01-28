import 'package:flutter/material.dart';
import 'package:speak_live_go/features/auth/presentation/widgets/step_skeleton.dart';
import 'package:speak_live_go/features/common/presentation/widgets/app_gap.dart';

class LoginEmailStep extends StatelessWidget {
  const LoginEmailStep({
    required this.onBack,
    required this.onContinue,
    required this.emailController,
    super.key,
  });

  final VoidCallback onBack;
  final VoidCallback? onContinue;
  final TextEditingController emailController;

  @override
  Widget build(BuildContext context) {
    return StepSkeleton(
      title: 'Login or sign up',
      onContinue: onContinue,
      onBackPressed: onBack,
      children: [
        const HBox(4),
        TextField(
          autofocus: true,
          controller: emailController,
          decoration: const InputDecoration(label: Text('Email')),
        ),
        const Spacer(),
      ],
    );
  }
}
