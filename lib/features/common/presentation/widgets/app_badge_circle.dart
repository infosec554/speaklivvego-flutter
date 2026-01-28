import 'package:flutter/material.dart';
import 'package:speak_live_go/utils/extensions/build_context/text_styles.dart';

class AppBadgeCircle extends StatelessWidget {
  const AppBadgeCircle({
    required this.size,
    required this.bgColor,
    this.info,
    this.infoColor,
    this.infoStyle,
    super.key,
  });

  final double size;
  final Color bgColor;
  final Color? infoColor;
  final TextStyle? infoStyle;

  final String? info;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(
          size / 2,
        ),
      ),
      child: info == null
          ? null
          : Text(
              info!,
              style:
                  infoStyle ??
                  context.c2A85F3primaryColorTextStyle?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: infoColor,
                    fontSize: 12,
                  ),
            ),
    );
  }
}
