import 'package:flutter/material.dart';
import 'package:speak_live_go/core/constants/app_colors.dart';
import 'package:speak_live_go/features/common/presentation/widgets/app_gap.dart';
import 'package:speak_live_go/features/profile/presentation/widgets/profile_box_bg.dart';
import 'package:speak_live_go/utils/extensions/build_context/text_styles.dart';

class RatingBox extends StatelessWidget {
  const RatingBox({super.key});

  @override
  Widget build(BuildContext context) {
    return ProfileBoxBg(
      title: 'Rating',
      padding: const EdgeInsets.all(16),
      children: [
        Row(
          children: [
            Expanded(
              child: _W(
                children: [
                  Text(
                    '96 %',
                    style: context.c19C38DColorTextStyle?.copyWith(
                      fontWeight: FontWeight.w600,
                      fontSize: 36,
                    ),
                  ),
                  const WBox(16),
                  Expanded(
                    child: Text(
                      '''
of users are satisfies 
with this conversation partner''',
                      style: context.c696969ColorTextStyle,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        const HBox(10),
        Row(
          spacing: 16,
          children: [
            Expanded(
              child: _W(
                children: [
                  Text(
                    '👍',
                    style: context.c19C38DColorTextStyle?.copyWith(
                      fontSize: 40,
                    ),
                  ),
                  const WBox(16),
                  Expanded(
                    child: Text(
                      '66',
                      style: context.cBlackColorTextStyle?.copyWith(
                        fontSize: 32,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: _W(
                children: [
                  Text(
                    '👎',
                    style: context.c19C38DColorTextStyle?.copyWith(
                      fontSize: 40,
                    ),
                  ),
                  const WBox(16),
                  Expanded(
                    child: Text(
                      '3',
                      style: context.cBlackColorTextStyle?.copyWith(
                        fontSize: 32,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        const HBox(30),
      ],
    );
  }
}

class _W extends StatelessWidget {
  const _W({required this.children});

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 84,
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: AppColors.cDBF5EC,
      ),
      child: Row(
        children: children,
      ),
    );
  }
}
