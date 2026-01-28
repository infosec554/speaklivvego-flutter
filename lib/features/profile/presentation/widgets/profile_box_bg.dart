import 'package:flutter/material.dart';
import 'package:speak_live_go/core/constants/app_colors.dart';
import 'package:speak_live_go/features/common/presentation/widgets/app_gap.dart';
import 'package:speak_live_go/features/common/presentation/widgets/app_texts/text_20_600.dart';

class ProfileBoxBg extends StatelessWidget {
  const ProfileBoxBg({
    required this.children,
    required this.title,
    super.key,
    this.padding,
  });

  final List<Widget> children;
  final EdgeInsetsGeometry? padding;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.c696969,
        ),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText20W600Black(title),
          const HBox(8),
          ...children,
        ],
      ),
    );
  }
}
