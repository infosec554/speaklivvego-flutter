
import 'dart:ui';

enum LanguageEnum {
  uz(
    // title: LocaleKeys.uz,
    // abr: LocaleKeys.uz_abr,
    // flag: AppImages.flagUz,
    locale: Locale('uz'),
  ),
  ru(
    // title: LocaleKeys.ru,
    // abr:LocaleKeys.ru_abr,
    // flag: AppImages.flagRu,
    locale: Locale('ru'),
  );

  const LanguageEnum({
    // required this.title,
    // required this.abr,
    // required this.flag,
    required this.locale,
  });

  // final String title;
  // final String flag;
  // final String abr;
  final Locale locale;
}

extension LanguageEnumExtension on LanguageEnum {
  bool get isUz => this == LanguageEnum.uz;
}
