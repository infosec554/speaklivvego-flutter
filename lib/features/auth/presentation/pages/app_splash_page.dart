import 'package:flutter/material.dart';
import 'package:speak_live_go/core/constants/assets/app_images.dart';

class AppSplashPage extends StatelessWidget {
  const AppSplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Image.asset(AppImages.appLogo)));
  }
}
