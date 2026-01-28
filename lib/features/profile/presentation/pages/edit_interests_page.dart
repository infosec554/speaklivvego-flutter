import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:speak_live_go/core/constants/app_colors.dart';
import 'package:speak_live_go/features/common/presentation/widgets/app_app_bar.dart';
import 'package:speak_live_go/features/common/presentation/widgets/app_gap.dart';
import 'package:speak_live_go/features/common/presentation/widgets/buttons/app_button.dart';
import 'package:speak_live_go/utils/extensions/build_context/text_styles.dart';

class EditInterestsPage extends StatefulWidget {
  const EditInterestsPage({
    this.initialInterests,
    super.key,
  });

  final List<String>? initialInterests;

  @override
  State<EditInterestsPage> createState() => _EditInterestsPageState();
}

class _EditInterestsPageState extends State<EditInterestsPage> {
  late final TextEditingController interestController;
  late List<String> interests;

  @override
  void initState() {
    super.initState();
    interestController = TextEditingController();
    interests = List<String>.from(widget.initialInterests ?? []);
  }

  @override
  void dispose() {
    interestController.dispose();
    super.dispose();
  }

  void addInterest() {
    final text = interestController.text.trim();
    if (text.isNotEmpty && !interests.contains(text)) {
      setState(() {
        interests.add(text);
        interestController.clear();
      });
    }
  }

  void removeInterest(String interest) {
    setState(() {
      interests.remove(interest);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppAppBar(
        title: 'Interests',
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: interestController,
              decoration: InputDecoration(
                hintText: 'Add your interest',
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 16,
                ),
                suffixIcon: Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: ElevatedButton(
                    onPressed: addInterest,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.c2A85F3primary,
                      foregroundColor: AppColors.white,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      minimumSize: const Size(0, 36),
                      elevation: 0,
                    ),
                    child: Text(
                      'Add',
                      style: context.cWhiteColorTextStyle,
                    ),
                  ),
                ),
                suffixIconConstraints: const BoxConstraints(
                  minWidth: 60,
                ),
              ),
              onSubmitted: (_) => addInterest(),
            ),
            const HBox(16),
            Expanded(
              child: Wrap(
                runSpacing: 10,
                spacing: 10,
                children: [
                  for (final interest in interests)
                    Chip(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 8,
                      ),
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(17),
                      ),
                      backgroundColor: AppColors.c2A85F3primary,
                      label: Text(
                        interest,
                        style: const TextStyle(color: Colors.white),
                      ),
                      onDeleted: () => removeInterest(interest),
                      deleteIcon: const Icon(
                        Icons.close,
                        size: 18,
                        color: Colors.white,
                      ),
                    ),
                ],
              ),
            ),
            const HBox(16),
            AppButton(
              title: 'Done',
              onPressed: () {
                context.pop(interests);
              },
            ),
          ],
        ),
      ),
    );
  }
}
