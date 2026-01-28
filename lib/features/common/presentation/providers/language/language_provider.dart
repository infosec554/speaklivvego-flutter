import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:speak_live_go/core/services/prefs/pref_keys.dart';
import 'package:speak_live_go/core/services/prefs/prefs.dart';
import 'package:speak_live_go/utils/extensions/nullable_string_extensions.dart';
import 'package:speak_live_go/features/common/domain/enums/language_enum.dart';

final languageProvider = NotifierProvider<LanguageNotifier, LanguageEnum>(() {
  return LanguageNotifier();
});

class LanguageNotifier extends Notifier<LanguageEnum> {
  LanguageNotifier();

  Future<void> changeLanguage(LanguageEnum v) async {
    debugPrint('>< >< before : ${state.name}');
    await Prefs().write(PrefKeys.languageCode, v.locale.languageCode);
    state = v;
  }

  @override
  LanguageEnum build() {
    final code = Prefs().read(PrefKeys.languageCode);

    return code.getLanguageEnumByLanguageCode;
  }
}
