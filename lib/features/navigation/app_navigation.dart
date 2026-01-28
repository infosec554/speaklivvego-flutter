import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:speak_live_go/features/navigation/presentation/widgets/app_nav_bar.dart';

class AppNavigation extends StatelessWidget {
  const AppNavigation({
    required this.navigationShell,
    super.key,
  });

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      extendBody: true,
      resizeToAvoidBottomInset: false,
      body: navigationShell,
      bottomNavigationBar: AppNavBar(
        currentIndex: navigationShell.currentIndex,
        onChange: (index) {
          navigationShell.goBranch(
            index,
            initialLocation: index == navigationShell.currentIndex,
          );
        },
      ),
    );
  }
}
