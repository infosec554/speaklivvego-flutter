import 'package:speak_live_go/features/common/domain/enums/language_enum.dart';

extension NullableStringExtensions on String? {
  LanguageEnum get getLanguageEnumByLanguageCode {
    for (final v in LanguageEnum.values) {
      if (v.locale.languageCode == this) {
        return v;
      }
    }
    return LanguageEnum.ru;
  }
}
