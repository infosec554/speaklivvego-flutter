import 'package:flutter/material.dart';
import 'package:speak_live_go/core/constants/app_colors.dart';
import 'package:speak_live_go/core/constants/assets/app_icons.dart';
import 'package:speak_live_go/core/constants/assets/app_images.dart';
import 'package:speak_live_go/features/common/presentation/widgets/app_gap.dart';
import 'package:speak_live_go/features/common/presentation/widgets/buttons/app_button.dart';
import 'package:speak_live_go/features/common/presentation/widgets/buttons/app_tap.dart';
import 'package:speak_live_go/utils/extensions/build_context/text_styles.dart';
import 'package:speak_live_go/utils/extensions/string_extensions.dart';

enum LoginInitialAction { google, email, privacyPolicy, termsOfUse }

class LoginInitialStep extends StatelessWidget {
  const LoginInitialStep({required this.onAction, super.key});

  final ValueChanged<LoginInitialAction> onAction;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Expanded(child: Image.asset(AppImages.appLogoFull)),
              AppButton(
                onPressed: () => onAction.call(LoginInitialAction.google),
                child: _ButtonChild(
                  icon: AppImages.googleLogo.toAssetImage(),
                  title: 'Sign in with Google',
                ),
              ),
              const HBox(20),
              AppButton(
                onPressed: () => onAction.call(LoginInitialAction.email),
                child: _ButtonChild(
                  icon: AppIcons.envelop.toSvgAsset(),
                  title: 'Sign in with Email',
                ),
              ),
              const HBox(64),
              Text.rich(
                textAlign: TextAlign.center,
                style: context.cBlackColorTextStyle?.copyWith(
                  fontWeight: FontWeight.w500,
                ),
                TextSpan(
                  children: [
                    const TextSpan(text: 'By signing in you agree to\n'),
                    WidgetSpan(
                      child: AppTap(
                        onTap: () =>
                            onAction.call(LoginInitialAction.privacyPolicy),
                        child: Text(
                          'privacy policy',
                          style: context.c2A85F3primaryColorTextStyle?.copyWith(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    const TextSpan(text: ' and '),
                    WidgetSpan(
                      child: AppTap(
                        onTap: () =>
                            onAction.call(LoginInitialAction.termsOfUse),
                        child: Text(
                          'terms of use',
                          style: context.c2A85F3primaryColorTextStyle?.copyWith(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ButtonChild extends StatelessWidget {
  const _ButtonChild({required this.icon, required this.title});

  final Widget icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _IconBg(child: icon),
        Text(title),
        const WBox(44),
      ],
    );
  }
}

class _IconBg extends StatelessWidget {
  const _IconBg({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 44,
      width: 44,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(14),
      ),
      child: child,
    );
  }
}
