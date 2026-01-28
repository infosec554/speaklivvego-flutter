import 'package:flutter/material.dart';
import 'package:speak_live_go/core/constants/assets/app_icons.dart';
import 'package:speak_live_go/utils/extensions/string_extensions.dart';

class AppSearchField extends StatelessWidget {
  const AppSearchField({
    this.controller,
    super.key,
    this.onChanged,
    this.hintText,
  });

  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final String? hintText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText ?? 'Search',
        suffixIcon: Padding(
          padding: const EdgeInsets.fromLTRB(4, 4, 12, 4),
          child: AppIcons.search.toSvgAsset(),
        ),
      ),
    );
  }
}
