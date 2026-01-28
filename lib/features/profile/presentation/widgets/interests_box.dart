import 'package:flutter/material.dart';
import 'package:speak_live_go/core/constants/app_colors.dart';
import 'package:speak_live_go/features/common/presentation/widgets/app_texts/text_20_600.dart';
import 'package:speak_live_go/features/common/presentation/widgets/buttons/app_tap.dart';
import 'package:speak_live_go/features/profile/presentation/widgets/profile_box_bg.dart';

class InterestsBox extends StatelessWidget {
  const InterestsBox({
    required this.interests,
    required this.onAdd,
    super.key,
  });

  final List<String> interests;
  final VoidCallback onAdd;

  @override
  Widget build(BuildContext context) {
    return ProfileBoxBg(
      title: 'Interests',
      padding: const EdgeInsets.all(16),
      children: [

        Row(
          children: [
            Expanded(
              child: Wrap(
                runSpacing: 10,
                spacing: 10,
                children: [
                  for (final v in interests) _w(v),
                  AppTap(
                    onTap: onAdd,
                    child: _w('Add +'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  Chip _w(String v) {
    return Chip(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 8,
      ),
      shape: RoundedRectangleBorder(
        side: const BorderSide(color: Colors.white),
        borderRadius: BorderRadius.circular(17),
      ),
      backgroundColor: AppColors.cD9D9D9,
      label: Text(v),
    );
  }
}
