import 'package:flutter/material.dart';
import 'package:speak_live_go/core/constants/app_colors.dart';
import 'package:speak_live_go/features/common/presentation/widgets/app_gap.dart';
import 'package:speak_live_go/features/common/presentation/widgets/app_texts/text_20_600.dart';
import 'package:speak_live_go/features/profile/data/models/profile/profile_model.dart';
import 'package:speak_live_go/features/profile/domain/enums/private_info_enum.dart';
import 'package:speak_live_go/features/profile/presentation/widgets/profile_box_bg.dart';
import 'package:speak_live_go/utils/extensions/build_context/text_styles.dart';
import 'package:speak_live_go/utils/extensions/string_extensions.dart';

class InfoBox extends StatelessWidget {
  const InfoBox({super.key, required this.profile});

  final ProfileModel profile;

  @override
  Widget build(BuildContext context) {
    return ProfileBoxBg(
      padding: const EdgeInsets.fromLTRB(14, 10, 16, 0),
title: 'Information',
      children: [

        for (final v in PrivateInfoEnum.values) ...[
          Row(
            children: [
              Container(
                height: 36,
                width: 36,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: AppColors.cF2F3F3,
                  borderRadius: BorderRadius.circular(
                    18,
                  ),
                ),
                child: v.getIcon.toSvgAsset(),
              ),
              const WBox(8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      v.getTitle,
                      style: context.c696969ColorTextStyle,
                    ),
                    Text(
                      profile.getInfoByEnum(v),
                      style: context.cBlackColorTextStyle?.copyWith(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const HBox(20),
        ],
      ],
    );
  }
}
