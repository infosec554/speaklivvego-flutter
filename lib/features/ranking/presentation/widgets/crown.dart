import 'package:flutter/material.dart';
import 'package:speak_live_go/core/constants/app_colors.dart';
import 'package:speak_live_go/core/constants/assets/app_icons.dart';
import 'package:speak_live_go/features/common/presentation/widgets/app_gap.dart';
import 'package:speak_live_go/utils/extensions/build_context/text_styles.dart';
import 'package:speak_live_go/utils/extensions/string_extensions.dart';

class Crown extends StatelessWidget {
  const Crown({
    required this.result,
    super.key,
  });

  final String result;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        /// just for alignment
        _ResultBox(
          result: result,
          invisible: true,
        ),
        const WBox(20),
        AppIcons.crown.toSvgAsset(),
        const WBox(20),
        _ResultBox(
          result: result,
        ),
      ],
    );
  }
}

class _ResultBox extends StatelessWidget {
  const _ResultBox({
    required this.result,
    this.invisible = false,
  });

  final String result;
  final bool invisible;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 43,
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: invisible ? Colors.transparent : AppColors.c2A85F3primary,
      ),
      child: Row(
        children: [
          AppIcons.fiveClock.toSvgAsset(
            color: invisible ? Colors.transparent : null,
          ),
          const WBox(4),
          Text(
            result,
            style: context.cE6E6E6ColorTextStyle?.copyWith(
              fontWeight: FontWeight.w500,
              fontSize: 12,
              color: invisible ? Colors.transparent : null,
            ),
          ),
        ],
      ),
    );
  }
}
