import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:speak_live_go/core/constants/app_colors.dart';
import 'package:speak_live_go/features/auth/presentation/login_view_steps/confirmation_step.dart';
import 'package:speak_live_go/features/common/presentation/widgets/app_app_bar.dart';
import 'package:speak_live_go/features/common/presentation/widgets/app_gap.dart';
import 'package:speak_live_go/features/common/presentation/widgets/buttons/app_button.dart';
import 'package:speak_live_go/features/settings/domain/change_email_step_enum.dart';
import 'package:speak_live_go/utils/extensions/build_context/text_styles.dart';

class ChangeEmailPage extends StatefulWidget {
  const ChangeEmailPage({super.key});

  @override
  State<ChangeEmailPage> createState() => _ChangeEmailPageState();
}

class _ChangeEmailPageState extends State<ChangeEmailPage> {
  late final TextEditingController emailController;
  bool _isButtonEnabled = false;
  ChangeEmailStepEnum _currentStep = ChangeEmailStepEnum.email;
  String _email = '';

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController()
      ..addListener(() {
        setState(() {
          _isButtonEnabled = emailController.text.isNotEmpty;
        });
      });
  }

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  void _goToNextStep() {
    setState(() {
      _email = emailController.text.trim();
      _currentStep = ChangeEmailStepEnum.confirmation;
    });
  }

  void _goToPreviousStep() {
    setState(() {
      _currentStep = ChangeEmailStepEnum.email;
    });
  }

  void _handleCodeFilled(String code) {
    // TODO: Implement email change API call with code
    // For now, just go back to settings
    context.pop();
  }

  @override
  Widget build(BuildContext context) {
    switch (_currentStep) {
      case ChangeEmailStepEnum.email:
        return Scaffold(
          appBar: const AppAppBar(
            title: 'Change the email',
          ),
          body: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: 'New email',
                    hintText: 'New email',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(
                        color: AppColors.c2A85F3primary,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(
                        color: AppColors.c2A85F3primary,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(
                        color: AppColors.c2A85F3primary,
                        width: 2,
                      ),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 16,
                    ),
                  ),
                ),
                const Spacer(),
                AppButton(
                  title: 'Continue',
                  onPressed: _isButtonEnabled ? _goToNextStep : null,
                ),
              ],
            ),
          ),
        );
      case ChangeEmailStepEnum.confirmation:
        return LoginConfirmationStep(
          email: _email,
          onChangeEmail: _goToPreviousStep,
          codeFilled: _handleCodeFilled,
        );
    }
  }
}

