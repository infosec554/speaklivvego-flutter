import 'package:flutter/material.dart';
import 'package:speak_live_go/core/constants/app_colors.dart';
import 'package:speak_live_go/core/constants/assets/app_images.dart';
import 'package:speak_live_go/features/common/presentation/widgets/app_gap.dart';
import 'package:speak_live_go/features/common/presentation/widgets/buttons/app_tap.dart';
import 'package:speak_live_go/utils/extensions/build_context/text_styles.dart';
import 'package:speak_live_go/utils/extensions/string_extensions.dart';

class AppInfoWidget extends StatelessWidget {
  const AppInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        AppImages.appLogo.toAssetImage(height: 40, width: 40),
        const WBox(12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'Speak',
                      style: context.cBlackColorTextStyle!.copyWith(
                        fontSize: 16,
                      ),
                    ),
                    TextSpan(
                      text: ' Live ',
                      style: context.cBlackColorTextStyle!.copyWith(
                        color: AppColors.c42BB55green,
                        fontSize: 16,
                      ),
                    ),
                    TextSpan(
                      text: 'Go',
                      style: context.c2A85F3primaryColorTextStyle!.copyWith(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),

              const HBox(4),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      'Version 1.0',
                      style: context.c696969ColorTextStyle?.copyWith(
                        fontSize: 12,
                      ),
                    ),
                  ),
                  AppTap(
                    onTap: () {
                      // Handle privacy policy
                    },
                    child: Text(
                      'Privacy Policy',
                      style: context.c696969ColorTextStyle?.copyWith(
                        fontSize: 12,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                  const WBox(9),
                  AppTap(
                    onTap: () {
                      // Handle terms of use
                    },
                    child: Text(
                      'Terms of use',
                      style: context.c696969ColorTextStyle?.copyWith(
                        fontSize: 12,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
