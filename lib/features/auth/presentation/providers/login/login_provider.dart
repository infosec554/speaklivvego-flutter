import 'package:equatable/equatable.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:speak_live_go/features/auth/domain/sign_in_step_enum.dart';

part 'login_state.dart';

final loginProvider = AutoDisposeNotifierProvider<LoginNotifier, LoginState>(
  LoginNotifier.new,
);

class LoginNotifier extends AutoDisposeNotifier<LoginState> {
  void updateState(LoginState v) {
    state = v;
  }

  @override
  LoginState build() {
    return const LoginState();
  }

  void onEmailChanged(String v) {
    updateState(state.copyWith(email: v));
  }

  void onPasswordChanged(String v) {
    updateState(state.copyWith(password: v));
  }

  void goNextStep() {
    switch (state.step) {
      case SignInStepEnum.initial:
        {
          updateState(state.copyWith(step: SignInStepEnum.email));
          break;
        }
      case SignInStepEnum.email:
        {
          updateState(state.copyWith(step: SignInStepEnum.hello));
          break;
        }
      case SignInStepEnum.hello:
        {
          updateState(state.copyWith(step: SignInStepEnum.confirmationCode));
          break;
        }
      case SignInStepEnum.confirmationCode:
        {
          updateState(state.copyWith(step: SignInStepEnum.createPassword));
          break;
        }
      case SignInStepEnum.createPassword:
    }
  }

  void goPreviousStep() {
    switch (state.step) {
      case SignInStepEnum.email:
        {
          updateState(state.copyWith(step: SignInStepEnum.initial));
          break;
        }
      case SignInStepEnum.hello:
        {
          updateState(state.copyWith(step: SignInStepEnum.email));
          break;
        }
      case SignInStepEnum.confirmationCode:
        {
          updateState(state.copyWith(step: SignInStepEnum.hello));
          break;
        }
      case SignInStepEnum.createPassword:
        {
          updateState(state.copyWith(step: SignInStepEnum.confirmationCode));
          break;
        }
      case SignInStepEnum.initial:
    }
  }
}
