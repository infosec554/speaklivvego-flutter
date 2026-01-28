import 'dart:io';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:speak_live_go/core/constants/app_colors.dart';
import 'package:speak_live_go/core/constants/assets/app_icons.dart';
import 'package:speak_live_go/features/common/presentation/widgets/app_gap.dart';
import 'package:speak_live_go/features/common/presentation/widgets/bg_wrappers/app_sheet_bg_wrapper.dart';
import 'package:speak_live_go/features/common/presentation/widgets/buttons/app_tap.dart';
import 'package:speak_live_go/utils/extensions/build_context/show_modal_bottom_sheet_extension.dart';
import 'package:speak_live_go/utils/extensions/build_context/text_styles.dart';
import 'package:speak_live_go/utils/extensions/string_extensions.dart';

class PickAvatarWidget extends StatefulWidget {
  const PickAvatarWidget({super.key, this.size = 100});

  final double size;

  @override
  State<PickAvatarWidget> createState() => _PickAvatarWidgetState();
}

class _PickAvatarWidgetState extends State<PickAvatarWidget> {
  File? _image;

  Future<void> pickImage({required ImageSource src}) async {
    final picker = ImagePicker();
    final picked = await picker.pickImage(
      source: src,
    );

    if (picked != null) {
      setState(() {
        _image = File(picked.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppTap(
      onTap: () async {
        final result = await context.showModalSheet<ImageSource>(
          content: const ChooseImgSrcSheet(),
        );
        if (result != null) {
          await pickImage(src: result);
        }
      },
      child: Stack(
        children: [
          CircleAvatar(
            radius: widget.size / 2,
            backgroundColor: AppColors.cE9E9E9,
            backgroundImage: _image != null ? FileImage(_image!) : null,
            child: _image == null
                ? AppIcons.avatarPlaceholder.toSvgAsset()
                : null,
          ),

          // Camera button
          Positioned(
            bottom: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.all(6),
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: AppIcons.camera.toSvgAsset(),
            ),
          ),
        ],
      ),
    );
  }
}

extension ImageSrcExtentision on ImageSource {
  String get toDisplay {
    switch (this) {
      case ImageSource.camera:
        return 'Take a photo';
      case ImageSource.gallery:
        return 'Pick from device';
    }
  }

  String get getIcon {
    switch (this) {
      case ImageSource.camera:
        return AppIcons.gallery;
      case ImageSource.gallery:
        return AppIcons.cameraBig;
    }
  }
}

class ChooseImgSrcSheet extends StatelessWidget {
  const ChooseImgSrcSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return AppSheetBgWrapper(
      title: 'Change photo',

      children: [
        for (final v in ImageSource.values) ...[
          AppTap(
            onTap: () {
              context.pop(v);
            },
            child: Row(
              children: [
                v.getIcon.toSvgAsset(),
                const WBox(16),
                Text(
                  v.toDisplay,
                  style: context.cBlackColorTextStyle?.copyWith(
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ),
          const HBox(20),
        ],
      ],
    );
  }
}
