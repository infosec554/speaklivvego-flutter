import 'package:flutter/material.dart';
import 'package:speak_live_go/core/constants/assets/app_icons.dart';
import 'package:speak_live_go/utils/extensions/build_context/text_styles.dart';
import 'package:speak_live_go/utils/extensions/string_extensions.dart';
import 'package:speak_live_go/features/common/presentation/widgets/app_gap.dart';
import 'package:speak_live_go/features/initial_info/domain/enums/gender_enum.dart';

class RateAndGender extends StatelessWidget {
  const RateAndGender({
    required this.rate,
    required this.gender,
    super.key,
    this.fontSize,
    this.mainAxisAlignment,
  });

  final double rate;
  final GenderEnum gender;
  final double? fontSize;
  final MainAxisAlignment? mainAxisAlignment;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.center,
      children: [
        AppIcons.thumbsUp.toSvgAsset(),
        const WBox(4),
        Text(
          '''$rate% - ${gender.getTitle}''',
          style: context.c2A85F3primaryColorTextStyle?.copyWith(
            fontSize: fontSize,
          ),
        ),
      ],
    );
  }
}
