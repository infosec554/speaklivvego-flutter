import 'package:flutter/material.dart';
import 'package:speak_live_go/features/common/presentation/widgets/app_gap.dart';
import 'package:speak_live_go/features/common/presentation/widgets/buttons/app_tap.dart';
import 'package:speak_live_go/features/profile/domain/enums/contact_us_enum.dart';
import 'package:speak_live_go/utils/extensions/build_context/text_styles.dart';
import 'package:speak_live_go/utils/extensions/string_extensions.dart';

class ContactUsWidget extends StatelessWidget {
  const ContactUsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [

        Expanded(
          child: Text(
            'Contact us',
            style: context.cBlackColorTextStyle?.copyWith(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        for (final v in ContactUsEnum.values) ...[
          const WBox(12),
          AppTap(
            onTap: () {},
            child: v.getIcon.toSvgAsset(),
          ),
        ],
      ],
    );
  }
}
