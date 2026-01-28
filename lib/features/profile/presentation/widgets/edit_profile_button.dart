import 'package:flutter/material.dart';
import 'package:speak_live_go/core/constants/app_colors.dart';
import 'package:speak_live_go/features/common/presentation/widgets/buttons/app_tap.dart';
import 'package:speak_live_go/utils/extensions/build_context/text_styles.dart';

class EditProfileButton extends StatelessWidget {
  const EditProfileButton({super.key, required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AppTap(
          onTap: onTap,
          child: Container(
            alignment: Alignment.center,
            height: 34,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(9),
              border: Border.all(
                color: AppColors.c696969,
              ),
            ),
            child: Text(
              'Edit profile',
              style: context.cBlackColorTextStyle?.copyWith(fontSize: 16),
            ),
          ),
        ),
      ],
    );
  }
}
