import 'dart:async';

import 'package:flutter/material.dart';
import 'package:speak_live_go/core/constants/app_colors.dart';
import 'package:speak_live_go/features/common/presentation/widgets/app_app_bar.dart';
import 'package:speak_live_go/features/common/presentation/widgets/app_gap.dart';
import 'package:speak_live_go/features/common/presentation/widgets/buttons/app_tap.dart';
import 'package:speak_live_go/utils/extensions/build_context/text_styles.dart';

class LoginConfirmationStep extends StatefulWidget {
  const LoginConfirmationStep({
    required this.email,
    required this.onChangeEmail,
    required this.codeFilled,
    super.key,
  });

  final String email;
  final ValueChanged<String> codeFilled;
  final VoidCallback onChangeEmail;

  @override
  State<LoginConfirmationStep> createState() => _LoginConfirmationStepState();
}

class _LoginConfirmationStepState extends State<LoginConfirmationStep> {
  final List<TextEditingController> _controllers = List.generate(
    4,
    (_) => TextEditingController(),
  );
  int _secondsRemaining = 30;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_secondsRemaining == 0) {
        timer.cancel();
      } else {
        setState(() => _secondsRemaining--);
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    for (final c in _controllers) {
      c.dispose();
    }
    super.dispose();
  }

  void _onChanged(int index, String value) {
    if (value.isNotEmpty && index < 3) {
      FocusScope.of(context).nextFocus();
    }
    if (value.isEmpty && index > 0) {
      FocusScope.of(context).previousFocus();
    }
    if (index == 3 && value.isNotEmpty) {
      final v = _controllers.map((e) => e.text).join();
      widget.codeFilled.call(v);
    }
  }

  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(
        24,
      ),
      borderSide: BorderSide.none,
    );
    return Scaffold(
      appBar: const AppAppBar(title: 'Sign up'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 36),
        child: Column(
          children: [
            const HBox(64),
            Text(
              'Confirmation code was sent to',
              style: context.cBlackColorTextStyle?.copyWith(
                fontWeight: FontWeight.w600,
                fontSize: 20,
              ),
            ),
            Text(
              widget.email,
              style: context.c535353ColorTextStyle?.copyWith(
                fontWeight: FontWeight.w600,
                fontSize: 20,
              ),
            ),
            const HBox(16),
            AppTap(
              onTap: widget.onChangeEmail,
              child: Text(
                'Change email',
                style: context.c2A85F3primaryColorTextStyle?.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const HBox(111),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 8,
              children: List.generate(4, (index) {
                return SizedBox(
                  height: 48,
                  width: 48,
                  child: Theme(
                    data: Theme.of(context).copyWith(
                      splashFactory: NoSplash.splashFactory,
                      highlightColor: Colors.transparent,
                      splashColor: Colors.transparent,
                    ),
                    child: TextField(
                      showCursor: false,
                      autofocus: true,
                      cursorColor: Colors.transparent,
                      controller: _controllers[index],
                      onChanged: (v) => _onChanged(index, v),
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      maxLength: 1,

                      decoration: InputDecoration(
                        fillColor: AppColors.cC1E2F3disableOrDivider,
                        filled: true,
                        errorBorder: border,
                        focusedBorder: border,
                        disabledBorder: border,
                        enabledBorder: border,
                        border: border,
                        focusedErrorBorder: border,
                        counterText: '',
                      ),
                    ),
                  ),
                );
              }),
            ),

            const HBox(16),
            const Text(
              'Enter the code',
              style: TextStyle(fontSize: 15, color: Colors.black54),
            ),
            const Spacer(),

            Text(
              _secondsRemaining > 0
                  ? 'You can get a new code in 00:$getRemaining'
                  : 'Didn’t get code? Resend',
              style: const TextStyle(
                fontSize: 14,
                color: Colors.black54,
                fontWeight: FontWeight.w400,
              ),
            ),
            const HBox(16),
          ],
        ),
      ),
    );
  }

  String get getRemaining => _secondsRemaining.toString().padLeft(2, '0');
}
