import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:speak_live_go/app/main_app.dart';
import 'package:speak_live_go/core/services/prefs/prefs.dart';
import 'package:speak_live_go/features/auth/presentation/providers/auth/auth_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Prefs().init();
  final initialAuthState = await checkInitAuthStateOut();

  runApp(MyApp(authState: initialAuthState));
}

class MyApp extends StatelessWidget {
  const MyApp({required this.authState, super.key});

  final AuthState authState;

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      overrides: [
        authProvider.overrideWith((ref) => AuthNotifier(ref, authState)),
      ],
      child: EasyLocalization(
        supportedLocales: const [Locale('uz'), Locale('ru'), Locale('en')],

        path: 'assets/locales',
        fallbackLocale: const Locale('ru'),
        startLocale: const Locale('ru'),
        child: const MainApp(),
      ),
    );
  }
}
