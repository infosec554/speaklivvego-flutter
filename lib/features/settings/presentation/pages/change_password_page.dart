import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:speak_live_go/features/common/presentation/widgets/app_app_bar.dart';
import 'package:speak_live_go/features/common/presentation/widgets/buttons/app_button.dart';
import 'package:speak_live_go/features/common/presentation/widgets/text_fields/app_password_field.dart';

class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({super.key});

  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  late final TextEditingController passwordController;
  bool _isButtonEnabled = false;

  @override
  void initState() {
    super.initState();
    passwordController = TextEditingController()
      ..addListener(() {
        setState(() {
          final length = passwordController.text.length;
          _isButtonEnabled = length >= 8 && length <= 50;
        });
      });
  }

  @override
  void dispose() {
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppAppBar(
        title: 'Create password',
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppPasswordField(
              controller: passwordController,
            ),

            const Spacer(),
            AppButton(
              title: 'Create',
              onPressed: _isButtonEnabled
                  ? () {
                      // Handle password change
                      context.pop();
                    }
                  : null,
            ),
          ],
        ),
      ),
    );
  }
}
