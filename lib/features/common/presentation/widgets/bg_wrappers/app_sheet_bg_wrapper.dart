import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:speak_live_go/core/constants/app_colors.dart';
import 'package:speak_live_go/features/common/presentation/widgets/app_gap.dart';
import 'package:speak_live_go/features/common/presentation/widgets/buttons/app_tap.dart';
import 'package:speak_live_go/utils/extensions/build_context/text_styles.dart';

class AppSheetBgWrapper extends StatelessWidget {
  const AppSheetBgWrapper({
    required this.title,
    this.children = const [],
    this.titleSize,
    super.key,
  });

  final List<Widget> children;
  final String title;
  final double? titleSize;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: AppTap(
            onTap: () {
              context.pop();
            },
            child: Container(
              color: Colors.transparent,
            ),
          ),
        ),
        Container(
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
              Text(
                title,
                style: context.cBlackColorTextStyle?.copyWith(
                  fontSize: titleSize ?? 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const HBox(16),

              ...children,
            ],
          ),
        ),
      ],
    );
  }
}
