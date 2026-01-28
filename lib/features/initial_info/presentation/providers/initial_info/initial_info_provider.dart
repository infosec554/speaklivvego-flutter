import 'package:equatable/equatable.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:speak_live_go/features/initial_info/data/models/language/language_model.dart';
import 'package:speak_live_go/features/initial_info/domain/enums/gender_enum.dart';
import 'package:speak_live_go/features/initial_info/domain/enums/initial_info_step_enum.dart';
import 'package:speak_live_go/features/initial_info/domain/enums/level_enum.dart';
import 'package:speak_live_go/features/initial_info/domain/enums/reason_enum.dart';

part 'initial_info_state.dart';

final initialInfoProvider =
    AutoDisposeNotifierProvider<InitialInfoNotifier, InitialInfoState>(
      InitialInfoNotifier.new,
    );

class InitialInfoNotifier extends AutoDisposeNotifier<InitialInfoState> {
  void updateState(InitialInfoState v) {
    state = v;
  }

  @override
  InitialInfoState build() {
    return const InitialInfoState();
  }

  void goNextStep() {
    InitialInfoStepEnum? next;
    switch (state.step) {
      case InitialInfoStepEnum.chooseReason:
        {
          next = InitialInfoStepEnum.greeting;
          break;
        }
      case InitialInfoStepEnum.greeting:
        {
          next = InitialInfoStepEnum.chooseNativeLanguage;
          break;
        }
      case InitialInfoStepEnum.chooseNativeLanguage:
        {
          next = InitialInfoStepEnum.whatIsYourLevel;
          break;
        }
      case InitialInfoStepEnum.whatIsYourLevel:
        {
          next = InitialInfoStepEnum.genderAndAge;
          break;
        }
      case InitialInfoStepEnum.genderAndAge:
        {
          next = InitialInfoStepEnum.chooseReason;
          break;
        }
    }
    updateState(state.copyWith(step: next));
  }

  void getPreviousStep() {
    InitialInfoStepEnum? previous;
    switch (state.step) {
      case InitialInfoStepEnum.chooseReason:
        {
          break;
        }
      case InitialInfoStepEnum.greeting:
        {
          previous = InitialInfoStepEnum.chooseReason;
          break;
        }
      case InitialInfoStepEnum.chooseNativeLanguage:
        {
          previous = InitialInfoStepEnum.greeting;
          break;
        }
      case InitialInfoStepEnum.whatIsYourLevel:
        {
          previous = InitialInfoStepEnum.chooseNativeLanguage;
          break;
        }
      case InitialInfoStepEnum.genderAndAge:
        {
          previous = InitialInfoStepEnum.whatIsYourLevel;
          break;
        }
    }
    updateState(state.copyWith(step: previous));
  }
}
