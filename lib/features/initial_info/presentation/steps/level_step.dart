import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:speak_live_go/utils/extensions/build_context/text_styles.dart';
import 'package:speak_live_go/features/auth/presentation/widgets/step_skeleton.dart';
import 'package:speak_live_go/features/common/presentation/widgets/app_activity_container.dart';
import 'package:speak_live_go/features/common/presentation/widgets/app_gap.dart';
import 'package:speak_live_go/features/common/presentation/widgets/app_radio.dart';
import 'package:speak_live_go/features/initial_info/domain/enums/level_enum.dart';

class LevelStep extends ConsumerWidget {
  const LevelStep({
    required this.title,
    required this.onChooseLevel,
    required this.onContinue,
    required this.onBack,
    required this.currentLevel,
    super.key,
  });

  final LevelEnum? currentLevel;
  final VoidCallback onBack;
  final ValueChanged<LevelEnum> onChooseLevel;
  final VoidCallback? onContinue;
  final String title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return StepSkeleton(
      title: title,
      onBackPressed: onBack,
      onContinue: onContinue,
      children: [
        Expanded(
          child: ListView.separated(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
            itemBuilder: (context, index) {
              final item = LevelEnum.values[index];
              final active = item == currentLevel;

              return AppActivityContainer(
                active: active,
                onTap: () => onChooseLevel(item),
                padding: const EdgeInsets.fromLTRB(20, 12, 12, 12),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item.getTitle,
                            style: context.cBlackColorTextStyle?.copyWith(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  item.getDescription,
                                  style: context.c555555ColorTextStyle,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const WBox(16),
                    AppRadio(active: active),
                  ],
                ),
              );
            },
            separatorBuilder: (_, _) => const HBox(12),
            itemCount: LevelEnum.values.length,
          ),
        ),
      ],
    );
  }
}
