import 'package:flutter/material.dart';
import 'package:speak_live_go/features/common/presentation/widgets/app_app_bar.dart';
import 'package:speak_live_go/features/common/presentation/widgets/app_gap.dart';
import 'package:speak_live_go/features/common/presentation/widgets/buttons/app_button.dart';
import 'package:speak_live_go/utils/extensions/build_context/text_styles.dart';

class ChangeSingleValuePage extends StatefulWidget {
  const ChangeSingleValuePage({
    required this.initial,
    required this.title,
    super.key,
  });

  final String initial;
  final String title;

  @override
  State<ChangeSingleValuePage> createState() => _ChangeSingleValuePageState();
}

class _ChangeSingleValuePageState extends State<ChangeSingleValuePage> {
  late final TextEditingController nameController;

  @override
  void initState() {
    nameController = TextEditingController(
      text: widget.initial,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final label = widget.title == 'Name' ? 'Your name' : null;
    return Scaffold(
      appBar: AppAppBar(
        title: widget.title,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(label: Text(label ?? '')),
            ),
            const HBox(16),
            Text(
              '''
Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, wh en an unknown printer took a galley of type and scrambled it to make a type specimen book''',
              style: context.c696969ColorTextStyle?.copyWith(
                fontSize: 13,
              ),
            ),
            const Spacer(),
            AppButton(
              title: 'Done',
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
