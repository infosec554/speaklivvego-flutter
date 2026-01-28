import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:speak_live_go/core/constants/app_colors.dart';
import 'package:speak_live_go/core/constants/assets/app_icons.dart';
import 'package:speak_live_go/utils/extensions/string_extensions.dart';
import 'package:speak_live_go/features/common/presentation/widgets/app_gap.dart';
import 'package:speak_live_go/features/common/presentation/widgets/app_texts/text_20_600.dart';
import 'package:speak_live_go/features/common/presentation/widgets/buttons/app_tap.dart';

class AppFullScreenSheetWrapper extends StatelessWidget {
  const AppFullScreenSheetWrapper({
    required this.title,
    this.children = const [],
    super.key,
  });

  final List<Widget> children;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      margin: const EdgeInsets.only(top: 48),
      padding: EdgeInsets.fromLTRB(
        20,
        20,
        20,
        MediaQuery.of(context).viewInsets.bottom + 20,
      ),
      decoration: const BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(25),
        ),
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppTap(
                onTap: () {
                  context.pop();
                },
                child: AppIcons.chevronDown.toSvgAsset(),
              ),
              AppText20W600Black(title),
              const WBox(24),
            ],
          ),

          const HBox(16),

          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: children,
            ),
          ),
        ],
      ),
    );
  }
}
