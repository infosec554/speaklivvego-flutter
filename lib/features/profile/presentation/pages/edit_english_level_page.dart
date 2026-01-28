import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:speak_live_go/features/common/presentation/widgets/app_activity_container.dart';
import 'package:speak_live_go/features/common/presentation/widgets/app_gap.dart';
import 'package:speak_live_go/features/common/presentation/widgets/app_radio.dart';
import 'package:speak_live_go/features/common/presentation/widgets/buttons/app_button.dart';
import 'package:speak_live_go/features/common/presentation/widgets/app_app_bar.dart';
import 'package:speak_live_go/features/initial_info/domain/enums/level_enum.dart';
import 'package:speak_live_go/utils/extensions/build_context/text_styles.dart';

class EditEnglishLevelPage extends StatefulWidget {
  const EditEnglishLevelPage({
    this.initialLevel,
    super.key,
  });

  final LevelEnum? initialLevel;

  @override
  State<EditEnglishLevelPage> createState() => _EditEnglishLevelPageState();
}

class _EditEnglishLevelPageState extends State<EditEnglishLevelPage> {
  LevelEnum? selectedLevel;

  @override
  void initState() {
    super.initState();
    selectedLevel = widget.initialLevel;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppAppBar(
        title: 'What is your English level?',
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                itemBuilder: (context, index) {
                  final item = LevelEnum.values[index];
                  final active = item == selectedLevel;

                  return AppActivityContainer(
                    active: active,
                    onTap: () {
                      setState(() {
                        selectedLevel = item;
                      });
                    },
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
            const HBox(16),
            AppButton(
              title: 'Done',
              onPressed: selectedLevel != null
                  ? () {
                      context.pop(selectedLevel);
                    }
                  : null,
            ),
          ],
        ),
      ),
    );
  }
}

