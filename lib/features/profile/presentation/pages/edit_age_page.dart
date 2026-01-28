import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:speak_live_go/features/common/presentation/widgets/app_gap.dart';
import 'package:speak_live_go/features/common/presentation/widgets/buttons/app_button.dart';
import 'package:speak_live_go/features/common/presentation/widgets/app_app_bar.dart';
import 'package:speak_live_go/utils/extensions/build_context/text_styles.dart';

class EditAgePage extends StatefulWidget {
  const EditAgePage({
    this.initialAge,
    super.key,
  });

  final String? initialAge;

  @override
  State<EditAgePage> createState() => _EditAgePageState();
}

class _EditAgePageState extends State<EditAgePage> {
  late final TextEditingController ageController;

  @override
  void initState() {
    super.initState();
    ageController = TextEditingController(text: widget.initialAge ?? '');
  }

  @override
  void dispose() {
    ageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppAppBar(
        title: 'Age',
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Enter your age',
              style: context.cBlackColorTextStyle?.copyWith(
                fontWeight: FontWeight.w500,
                fontSize: 20,
              ),
            ),
            const HBox(12),
            TextField(
              controller: ageController,
              onChanged: (_) => setState(() {}),
              style: context.c2A85F3primaryColorTextStyle?.copyWith(
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
              ],
              maxLength: 3,
              decoration: const InputDecoration(counterText: ''),
              keyboardType: TextInputType.number,
            ),
            const Spacer(),
            AppButton(
              title: 'Done',
              onPressed: ageController.text.isNotEmpty
                  ? () {
                      context.pop(ageController.text);
                    }
                  : null,
            ),
          ],
        ),
      ),
    );
  }
}

