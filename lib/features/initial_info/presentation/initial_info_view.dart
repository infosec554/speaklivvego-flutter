import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:speak_live_go/core/services/prefs/pref_keys.dart';
import 'package:speak_live_go/core/services/prefs/prefs.dart';
import 'package:speak_live_go/features/auth/presentation/providers/auth/auth_provider.dart';
import 'package:speak_live_go/features/initial_info/domain/enums/initial_info_step_enum.dart';
import 'package:speak_live_go/features/initial_info/presentation/providers/initial_info/initial_info_provider.dart';
import 'package:speak_live_go/features/initial_info/presentation/steps/choose_language_step.dart';
import 'package:speak_live_go/features/initial_info/presentation/steps/choose_reason_step.dart';
import 'package:speak_live_go/features/initial_info/presentation/steps/gender_and_age_step.dart';
import 'package:speak_live_go/features/initial_info/presentation/steps/greeting_step.dart';
import 'package:speak_live_go/features/initial_info/presentation/steps/level_step.dart';

class InitialInfoView extends ConsumerWidget {
  const InitialInfoView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(initialInfoProvider);
    final notifier = ref.watch(initialInfoProvider.notifier);
    switch (state.step) {
      case InitialInfoStepEnum.chooseReason:
        return ChooseReasonStep(
          currentReason: state.reason,
          onChangeReason: (v) {
            notifier.updateState(state.copyWith(reason: v));
          },
          onContinue: state.isButtonEnabled ? notifier.goNextStep : null,
        );
      case InitialInfoStepEnum.greeting:
        return GreetingStep(
          reason: state.reason!,
          onContinue: notifier.goNextStep,
        );
      case InitialInfoStepEnum.chooseNativeLanguage:
        return ChooseLanguageStep(
          title: state.step.getTitle,
          onChangeLanguage: (v) {
            notifier.updateState(state.copyWith(language: v));
          },
          currentLanguage: state.language,
          onContinue: state.isButtonEnabled ? notifier.goNextStep : null,
        );
      case InitialInfoStepEnum.whatIsYourLevel:
        return LevelStep(
          currentLevel: state.level,
          title: state.step.getTitle,
          onChooseLevel: (v) {
            notifier.updateState(
              state.copyWith(level: v),
            );
          },
          onContinue: state.isButtonEnabled ? notifier.goNextStep : null,
          onBack: notifier.getPreviousStep,
        );
      case InitialInfoStepEnum.genderAndAge:
        return GenderAndAgeStep(
          onBack: notifier.getPreviousStep,
          currentGender: state.gender,
          title: state.step.getTitle,
          onGenderChange: (v) {
            notifier.updateState(
              state.copyWith(gender: v),
            );
          },
          onContinue: state.isButtonEnabled
              ? () async {
                  await Prefs().write(PrefKeys.accessToken, 'access token');
                  await Prefs().write(PrefKeys.refreshToken, 'refresh token');
                  ref.read(authProvider.notifier).checkAuth();
                }
              : null,
          onAgeChanged: (v) {
            notifier.updateState(
              state.copyWith(
                age: v,
              ),
            );
          },
        );
    }
  }
}
