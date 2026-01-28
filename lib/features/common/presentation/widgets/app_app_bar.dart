import 'package:flutter/material.dart';
import 'package:speak_live_go/core/constants/font_family_names.dart';
import 'package:speak_live_go/features/common/presentation/widgets/app_back_icon_button.dart';
import 'package:speak_live_go/features/common/presentation/widgets/base_app_bar.dart';
import 'package:speak_live_go/utils/extensions/build_context/text_styles.dart';

class AppAppBar extends BaseAppBar {
  const AppAppBar({
    required this.title,
    super.key,
    this.centerTitle = true,
    this.actions,
    this.backgroundColor,
    this.titleColor,
    this.elevation = 1,
    this.leading,
    this.bottom,
    this.automaticallyImplyLeading = true,
    super.addToHeight,
  });

  final String title;
  final bool centerTitle;
  final List<Widget>? actions;
  final Color? backgroundColor;
  final Color? titleColor;
  final double elevation;
  final Widget? leading;
  final bool automaticallyImplyLeading;
  final PreferredSizeWidget? bottom;

  @override
  Widget build(BuildContext context) {
    final canPop = Navigator.of(context).canPop();

    return AppBar(
      automaticallyImplyLeading: automaticallyImplyLeading,
      backgroundColor:
          backgroundColor ?? Theme.of(context).scaffoldBackgroundColor,
      elevation: elevation,
      centerTitle: centerTitle,
      titleTextStyle: context.cBlackColorTextStyle?.copyWith(
        fontWeight: FontWeight.w600,
        fontSize: 20,
        fontFamily: FFN.poppins,
      ),
      title: Text(
        title,
      ),

      leading:
          leading ??
          (canPop
              ? AppBackIconButton(
                  onPressed: () => Navigator.of(context).maybePop(),
                )
              : null),

      leadingWidth: 60,
      actions: actions,
      actionsPadding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
      iconTheme: IconThemeData(color: titleColor ?? Colors.black),
      bottom: bottom,
    );
  }
}
