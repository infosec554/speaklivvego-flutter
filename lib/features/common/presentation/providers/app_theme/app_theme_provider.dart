import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:speak_live_go/core/services/prefs/pref_keys.dart';
import 'package:speak_live_go/core/services/prefs/prefs.dart';
import 'package:speak_live_go/core/theme/app_theme.dart';

class AppThemeProvider extends StateNotifier<ThemeMode> {
  AppThemeProvider(this.ref) : super(ThemeMode.dark);

  final Ref ref;
  static const ThemeMode defaultMode = ThemeMode.light;

  bool get isDarkMode => state == ThemeMode.dark;

  Future<void> initTheme() async {
    final colorTheme = Prefs().read(PrefKeys.currentTheme);

    state = colorTheme == null
        ? defaultMode
        : colorTheme == 'dark_theme_data.dart'
        ? ThemeMode.dark
        : ThemeMode.light;
  }

  Future<void> switchTheme() async {
    state = state.isDark ? ThemeMode.light : ThemeMode.dark;

    await Prefs().write(
      PrefKeys.currentTheme,
      state.isDark ? 'dark_theme_data.dart' : 'light',
    );
  }
}

final themeProvider = StateNotifierProvider<AppThemeProvider, ThemeMode>(
  AppThemeProvider.new,
);
