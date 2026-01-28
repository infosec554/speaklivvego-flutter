import 'package:flutter/material.dart';
import 'package:speak_live_go/core/constants/assets/app_icons.dart';
import 'package:speak_live_go/utils/extensions/string_extensions.dart';
import 'package:speak_live_go/features/common/presentation/widgets/app_app_bar.dart';
import 'package:speak_live_go/features/common/presentation/widgets/base_app_bar.dart';
import 'package:speak_live_go/features/common/presentation/widgets/buttons/app_tap.dart';

class AppBarOfLobbyView extends BaseAppBar {
  const AppBarOfLobbyView({required this.onFilter, super.key});

  final VoidCallback? onFilter;

  @override
  Widget build(BuildContext context) {
    return AppAppBar(
      title: 'Lobby',
      actions: [
        AppTap(
          onTap: onFilter,
          child: AppIcons.filter.toSvgAsset(),
        ),
      ],
    );
  }
}
