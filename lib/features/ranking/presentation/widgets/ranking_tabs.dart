import 'package:flutter/material.dart';
import 'package:speak_live_go/core/constants/app_colors.dart';
import 'package:speak_live_go/features/common/presentation/widgets/buttons/app_tap.dart';
import 'package:speak_live_go/features/ranking/enums/ranking_tab_enum.dart';
import 'package:speak_live_go/utils/extensions/build_context/text_styles.dart';

class RankingTabs extends StatelessWidget implements PreferredSizeWidget {
  const RankingTabs({
    required this.current,
    required this.onChanged,
    super.key,
  });

  final RankingTabEnum current;
  final ValueChanged<RankingTabEnum> onChanged;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      margin: const EdgeInsets.only(top: 16),
      duration: const Duration(milliseconds: 300),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          for (final v in RankingTabEnum.values)
            Expanded(
              child: AppTap(
                onTap: () => onChanged.call(v),
                child: Builder(
                  builder: (context) {
                    final active = v == current;
                    final textStyle = active
                        ? context.cWhiteColorTextStyle?.copyWith(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          )
                        : context.c696969ColorTextStyle?.copyWith(
                            fontSize: 16,
                          );
                    return Container(
                      height: 40,
                      alignment: Alignment.center,
                      margin: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: active
                            ? AppColors.c2A85F3primary
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Text(
                        v.toDisplay,
                        style: textStyle,
                      ),
                    );
                  },
                ),
              ),
            ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size(double.maxFinite, 40);
}
