import 'dart:math';

import 'package:flutter/material.dart';
import 'package:speak_live_go/core/constants/app_colors.dart';
import 'package:speak_live_go/utils/extensions/build_context/text_styles.dart';
import 'package:speak_live_go/features/common/presentation/widgets/buttons/app_tap.dart';
import 'package:speak_live_go/features/initial_info/domain/enums/level_enum.dart';

class LevelChart extends StatelessWidget {
  const LevelChart({
    required this.flexes,
    required this.onChanged,
    required this.currentLevels,
    super.key,
  });

  final ValueChanged<LevelEnum> onChanged;
  final List<LevelEnum> currentLevels;
  final Map<LevelEnum, int> flexes;

  double get equivalent => 85;

  int get getMax {
    var max = 0;
    for (final v in flexes.values) {
      if (v > max) {
        max = v;
      }
    }
    return max;
  }

  (int, int) getFlex(LevelEnum v) {
    final src = flexes[v]!;
    final n = src / getMax;
    final flex = (n * equivalent).toInt();
    final emptyFlex = (equivalent - flex).toInt();
    return (max(1, emptyFlex), max(1, flex));
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: equivalent,
      width: double.maxFinite,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          for (final v in LevelEnum.values)
            Builder(
              builder: (context) {
                final flex = getFlex(v);
                final active = currentLevels.contains(v);
                return AppTap(
                  onTap: () {
                    onChanged(v);
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: Column(
                      children: [
                        Spacer(
                          flex: flex.$1,
                        ),
                        Expanded(
                          flex: flex.$2,
                          child: Container(
                            width: 22,

                            decoration: BoxDecoration(
                              color: active
                                  ? AppColors.c2A85F3primary
                                  : AppColors.cD9D9D9,
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                        ),
                        Text(
                          v.getShortTitle,
                          style: context.c2A85F3primaryColorTextStyle?.copyWith(
                            color: active ? null : AppColors.c696969,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
        ],
      ),
    );
  }
}
