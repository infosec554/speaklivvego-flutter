import 'package:flutter/material.dart';
import 'package:speak_live_go/core/constants/assets/app_icons.dart';
import 'package:speak_live_go/utils/extensions/string_extensions.dart';
import 'package:speak_live_go/features/common/presentation/widgets/app_gap.dart';
import 'package:speak_live_go/features/common/presentation/widgets/buttons/app_tap.dart';

class AppPasswordField extends StatefulWidget {
  const AppPasswordField({
    required this.controller,
    super.key,
    this.onChanged,
    this.label,
  });

  final TextEditingController controller;
  final ValueChanged<String>? onChanged;
  final String? label;

  @override
  State<AppPasswordField> createState() => _AppPasswordFieldState();
}

class _AppPasswordFieldState extends State<AppPasswordField>
    with SingleTickerProviderStateMixin {
  bool _obscureText = true;
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 250),
    );
  }

  void _toggle() {
    setState(() async {
      _obscureText = !_obscureText;
      if (_obscureText) {
        await _controller.reverse();
      } else {
        await _controller.forward();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      autofocus: true,
      obscureText: _obscureText,
      controller: widget.controller,

      decoration: InputDecoration(
        suffixIcon: Padding(
          padding: const EdgeInsets.all(8),
          child: AppTap(
            onTap: _toggle,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  child: Builder(
                    builder: (context) {
                      if (_obscureText) {
                        return AppIcons.eyeOpen.toSvgAsset();
                      }
                      return AppIcons.eyeClosed.toSvgAsset();
                    },
                  ),
                  transitionBuilder: (child, animation) {
                    return RotationTransition(
                      turns: animation,
                      child: child,
                    );
                  },
                ),
                const WBox(4),
              ],
            ),
          ),
        ),
        label: Text(
          widget.label ?? '8 - 50 characters',
        ),
      ),
    );
  }
}
