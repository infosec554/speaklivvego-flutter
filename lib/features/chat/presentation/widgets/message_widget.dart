import 'package:flutter/material.dart';
import 'package:speak_live_go/core/constants/app_colors.dart';
import 'package:speak_live_go/features/chat/data/models/message_model.dart';
import 'package:speak_live_go/features/common/presentation/widgets/app_gap.dart';
import 'package:speak_live_go/utils/extensions/build_context/text_styles.dart';
import 'package:speak_live_go/utils/extensions/date_time_extensions.dart';

class MessageWidget extends StatelessWidget {
  const MessageWidget({super.key, required this.item});

  final MessageModel item;

  Color get getBgColor => item.isMine
      ? AppColors.cACADB9.withOpacity(.15)
      : AppColors.c2A85F3primary;

  CrossAxisAlignment get getCross =>
      item.isMine ? CrossAxisAlignment.end : CrossAxisAlignment.start;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: getCross,
      children: [
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.elliptical(16, 12)),
            color: getBgColor,
          ),

          child: ConstrainedBox(
            constraints: BoxConstraints(
              minWidth: 60,
              maxWidth: MediaQuery.of(context).size.width * .7,
            ),
            child: Text(
              item.content,
              style:
                  (item.isMine
                          ? context.c323142ColorTextStyle
                          : context.cF5F6FAColorTextStyle)
                      ?.copyWith(
                        fontSize: 16,
                        color: item.isMine ? AppColors.cACADB9 : null,
                      ),
            ),
          ),
        ),
        const HBox(12),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Text(
            item.date.getHHmm,
            style: context.c918FB7ColorTextStyle,
          ),
        ),
      ],
    );
  }
}
