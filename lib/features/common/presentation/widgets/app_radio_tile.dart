import 'package:flutter/material.dart';
import 'package:speak_live_go/utils/extensions/build_context/text_styles.dart';
import 'package:speak_live_go/features/common/presentation/widgets/app_radio.dart';
import 'package:speak_live_go/features/common/presentation/widgets/buttons/app_tap.dart';

class AppRadioTile extends StatelessWidget {
  const AppRadioTile({
    required this.onTap,
    required this.title,
    required this.active,
    this.padding,
    super.key,
  });

  final VoidCallback onTap;
  final String title;
  final EdgeInsetsGeometry? padding;
  final bool active;

  @override
  Widget build(BuildContext context) {
    return AppTap(
      onTap: onTap,
      child: Padding(
        padding: padding ?? const EdgeInsets.all(12),
        child: Row(
          children: [
            Expanded(
              child: Text(
                title,
                style: context.cBlackColorTextStyle?.copyWith(
                  fontSize: 18,
                ),
              ),
            ),
            AppRadio(active: active),
          ],
        ),
      ),
    );
  }
}
