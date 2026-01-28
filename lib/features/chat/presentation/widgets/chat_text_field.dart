import 'package:flutter/material.dart';
import 'package:speak_live_go/core/constants/app_colors.dart';
import 'package:speak_live_go/core/constants/app_shadows.dart';
import 'package:speak_live_go/core/constants/assets/app_icons.dart';
import 'package:speak_live_go/utils/extensions/build_context/text_styles.dart';
import 'package:speak_live_go/utils/extensions/string_extensions.dart';
import 'package:speak_live_go/features/common/presentation/widgets/buttons/app_tap.dart';

class ChatTextField extends StatelessWidget {
  const ChatTextField({
    required this.controller,
    required this.onSend,
    this.maxHeight = 300,
    super.key,
  });

  final TextEditingController controller;
  final VoidCallback onSend;
  final double maxHeight;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(
        20,
        0,
        20,
        MediaQuery.of(context).viewInsets.bottom + 20,
      ),
      padding: const EdgeInsets.fromLTRB(16, 0, 8, 0),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.elliptical(16, 12)),
        color: AppColors.white,
        boxShadow: AppShadows.chatTextField,
      ),

      /// Let the height grow naturally
      child: ConstrainedBox(
        constraints: BoxConstraints(
          minHeight: 60,
          maxHeight: maxHeight,
        ),
        child: Row(
          children: [
            Expanded(
              child: Theme(
                data: Theme.of(context).copyWith(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                ),
                child: TextField(
                  controller: controller,
                  maxLines: null,
                  keyboardType: TextInputType.multiline,
                  decoration: InputDecoration(
                    filled: true,

                    fillColor: AppColors.white,
                    hintText: 'Write now…',
                    hintStyle: context.cACADB9TextStyle?.copyWith(fontSize: 16),
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 18,
                      horizontal: 12,
                    ),
                    border: InputBorder.none,
                    errorBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    focusedErrorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                  ),
                ),
              ),
            ),

            /// Send button
            AppTap(
              onTap: onSend,
              child: Padding(
                padding: const EdgeInsets.only(right: 10),
                child: AppIcons.sendMessage.toSvgAsset(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
