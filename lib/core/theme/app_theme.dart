import 'package:flutter/material.dart';
import 'package:speak_live_go/core/theme/dark_theme_data.dart';
import 'package:speak_live_go/core/theme/light_theme.dart';

extension ThemeModeExtension on ThemeMode {
  bool get isDark => this == ThemeMode.dark;
}

abstract class AppTheme {
  static ThemeData get dark => darkThemeData;

  static ThemeData get light => lightThemeData;
}
