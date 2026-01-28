import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:speak_live_go/core/routing/app_router_points.dart';
import 'package:speak_live_go/features/auth/domain/sign_in_step_enum.dart';
import 'package:speak_live_go/features/auth/presentation/login_view_steps/confirmation_step.dart';
import 'package:speak_live_go/features/auth/presentation/login_view_steps/create_password_step.dart';
import 'package:speak_live_go/features/auth/presentation/login_view_steps/email_step.dart';
import 'package:speak_live_go/features/auth/presentation/login_view_steps/hello_step.dart';
import 'package:speak_live_go/features/auth/presentation/login_view_steps/initial_step.dart';
import 'package:speak_live_go/features/auth/presentation/providers/login/login_provider.dart';

class LoginView extends ConsumerStatefulWidget {
  const LoginView({super.key});

  @override
  ConsumerState<LoginView> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginView> {
  late TextEditingController emailController;
  late TextEditingController passwordController;

  @override
  void initState() {
    emailController = TextEditingController()..addListener(_emailListener);
    passwordController = TextEditingController()
      ..addListener(_passwordListener);
    super.initState();
  }

  void _emailListener() {
    ref.read(loginProvider.notifier).onEmailChanged(emailController.text);
  }

  void _passwordListener() {
    ref.read(loginProvider.notifier).onEmailChanged(emailController.text);
  }

  @override
  void dispose() {
    emailController
      ..removeListener(_emailListener)
      ..dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(loginProvider);
    final notifier = ref.read(loginProvider.notifier);
    switch (state.step) {
      case SignInStepEnum.initial:
        return LoginInitialStep(
          onAction: (LoginInitialAction value) {
            switch (value) {
              case LoginInitialAction.google:
              case LoginInitialAction.email:
              case LoginInitialAction.privacyPolicy:
              case LoginInitialAction.termsOfUse:
                notifier.goNextStep();
            }
          },
        );
      case SignInStepEnum.email:
        return LoginEmailStep(
          onContinue: state.buttonEnabled ? notifier.goNextStep : null,
          onBack: notifier.goPreviousStep,
          emailController: emailController,
        );
      case SignInStepEnum.hello:
        {
          return HelloStep(
            email: state.email,
            onUseAnotherEmail: notifier.goPreviousStep,
            onCreateAccount: notifier.goNextStep,
          );
        }
      case SignInStepEnum.confirmationCode:
        return LoginConfirmationStep(
          email: state.email,
          onChangeEmail: () {
            notifier.updateState(state.copyWith(step: SignInStepEnum.email));
          },
          codeFilled: (code) {
            notifier.goNextStep();
          },
        );
      case SignInStepEnum.createPassword:
        return CreatePasswordStep(
          onBack: notifier.goPreviousStep,
          onContinue: () {
            context.goNamed(
              AppRouterPoints.initialInfo.name,
            );
          },
          passwordController: passwordController,
        );
    }
  }
}
