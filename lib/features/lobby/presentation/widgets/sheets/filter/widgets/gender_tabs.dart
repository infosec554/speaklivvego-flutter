import 'package:flutter/material.dart';
import 'package:speak_live_go/core/constants/app_colors.dart';
import 'package:speak_live_go/utils/extensions/build_context/text_styles.dart';
import 'package:speak_live_go/features/common/presentation/widgets/buttons/app_tap.dart';
import 'package:speak_live_go/features/initial_info/domain/enums/gender_enum.dart';

class GenderTabs extends StatelessWidget {
  const GenderTabs({
    required this.onChanged,
    super.key,
    this.current,
  });

  final GenderEnum? current;
  final ValueChanged<GenderEnum?> onChanged;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      child: Row(
        spacing: 1.5,
        children: [
          Expanded(
            child: AppTap(
              onTap: () {
                onChanged(null);
              },
              child: _GenderTab(
                title: 'All',
                borderRadius: const BorderRadius.horizontal(
                  left: Radius.circular(
                    20,
                  ),
                ),
                active: current == null,
              ),
            ),
          ),
          for (final v in GenderEnum.values)
            Expanded(
              child: AppTap(
                onTap: () {
                  onChanged(v);
                },
                child: _GenderTab(
                  title: v.getTitle,
                  borderRadius: v.isMale
                      ? null
                      : const BorderRadius.horizontal(
                          right: Radius.circular(
                            20,
                          ),
                        ),
                  active: current == v,
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class _GenderTab extends StatelessWidget {
  const _GenderTab({
    required this.title,
    required this.borderRadius,
    required this.active,
  });

  final String title;
  final BorderRadiusGeometry? borderRadius;
  final bool active;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        borderRadius: borderRadius,
        color: active ? AppColors.c2A85F3primary : AppColors.cD9D9D9,
      ),
      alignment: Alignment.center,
      child: Text(
        title,
        style: context.cBlackColorTextStyle?.copyWith(
          fontSize: 16,
          color: active ? AppColors.white : null,
        ),
      ),
    );
  }
}
