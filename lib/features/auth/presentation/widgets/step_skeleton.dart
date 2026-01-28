import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:speak_live_go/features/common/presentation/widgets/app_app_bar.dart';
import 'package:speak_live_go/features/common/presentation/widgets/app_back_icon_button.dart';
import 'package:speak_live_go/features/common/presentation/widgets/buttons/app_button.dart';

class StepSkeleton extends ConsumerWidget {
  const StepSkeleton({
    required this.onContinue,
    required this.children,
    this.title,
    this.onBackPressed,
    this.continueButtonTitle,
    this.crossAxisAlignment,
    super.key,
  });

  final VoidCallback? onContinue;
  final String? title;
  final String? continueButtonTitle;
  final List<Widget> children;
  final VoidCallback? onBackPressed;
  final CrossAxisAlignment? crossAxisAlignment;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppAppBar(
        automaticallyImplyLeading: false,

        title: title ?? '',
        leading: onBackPressed == null
            ? null
            : AppBackIconButton(
                onPressed: onBackPressed,
              ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.center,
          children: [
            ...children,
            AppButton(
              title: continueButtonTitle ?? 'Continue',
              onPressed: onContinue,
            ),
          ],
        ),
      ),
    );
  }
}
