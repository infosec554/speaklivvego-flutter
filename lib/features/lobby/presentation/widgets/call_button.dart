import 'package:flutter/material.dart';
import 'package:speak_live_go/utils/extensions/build_context/text_styles.dart';
import 'package:speak_live_go/features/common/presentation/widgets/app_gap.dart';
import 'package:speak_live_go/features/common/presentation/widgets/buttons/app_icon_button.dart';
import 'package:speak_live_go/features/lobby/domain/enums/call_button_type_enum.dart';

class CallButton extends StatelessWidget {
  const CallButton({
    required this.onTap,
    required this.type,
    super.key,
  });

  final VoidCallback onTap;
  final CallButtonTypeEnum type;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppIconButton(
          icon: type.getIcon,
          bgColor: type.getBgColor,
          onTap: onTap,
        ),
        const HBox(2),
        Stack(
          alignment: Alignment.center,
          children: [
            Text(
             'Message',
              style: context.c696969ColorTextStyle?.copyWith(
                fontSize: 12,
                color: Colors.transparent
              ),
            ),   Text(
              type.getTitle,
              style: context.c696969ColorTextStyle?.copyWith(
                fontSize: 12,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
