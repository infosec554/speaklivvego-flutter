import 'package:flutter/material.dart';
import 'package:speak_live_go/features/common/presentation/widgets/app_gap.dart';

class ContactsListSkeleton extends StatelessWidget {
  const ContactsListSkeleton({
    required this.length,
    required this.itemBuilder,
    super.key,
  });

  final int length;
  final NullableIndexedWidgetBuilder itemBuilder;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemBuilder: itemBuilder,
      separatorBuilder: (_, _) => const HBox(12),
      itemCount: length,
    );
  }
}
