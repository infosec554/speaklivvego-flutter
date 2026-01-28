import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:speak_live_go/core/routing/app_router.dart';
import 'package:speak_live_go/core/theme/app_theme.dart';
import 'package:speak_live_go/features/common/presentation/providers/language/language_provider.dart';

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    void rebuildAllChildren() {
      void rebuild(Element el) {
        el
          ..markNeedsBuild()
          ..visitChildren(rebuild);
      }

      (context as Element).visitChildren(rebuild);
    }

    ref.listen(languageProvider, (previous, next) {
      WidgetsBinding.instance.addPostFrameCallback((_) async {
        debugPrint('>< >< supported locales : ${context.supportedLocales}');
        await context.setLocale(next.locale);
        rebuildAllChildren();
      });
    });
    final appRouter = ref.watch(routerProvider);

    return MaterialApp.router(
      title: 'Speak Live Go',
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      locale: context.locale,
      themeMode: ThemeMode.light,
      builder: (context, child) {
        return EasyLoading.init().call(context, child);
      },
      debugShowCheckedModeBanner: false,
      routerDelegate: appRouter.routerDelegate,
      supportedLocales: context.supportedLocales,
      localizationsDelegates: context.localizationDelegates,
      routeInformationProvider: appRouter.routeInformationProvider,
      routeInformationParser: appRouter.routeInformationParser,
    );
  }
}
