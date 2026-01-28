import 'package:flutter/material.dart';
import 'package:speak_live_go/utils/extensions/build_context/text_styles.dart';
import 'package:speak_live_go/utils/extensions/string_extensions.dart';
import 'package:speak_live_go/features/common/presentation/widgets/buttons/app_tap.dart';

class SlideAction extends StatelessWidget {
  const SlideAction({
    required this.bgColor,
    required this.title,
    required this.icon,
    required this.onPressed,
    this.borderRadius,
    this.margin,
    super.key,
  });

  final Color bgColor;
  final String title;
  final String icon;
  final VoidCallback onPressed;
  final BorderRadiusGeometry? borderRadius;
  final EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 86,
      child: AppTap(
        onTap: onPressed,
        child: Container(
          margin: margin,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: borderRadius,
            color: bgColor,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              icon.toSvgAsset(),
              Text(
                title,
                style: context.cWhiteColorTextStyle?.copyWith(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
