import 'package:flutter/material.dart';
import 'package:speak_live_go/features/contacts/data/models/contact/contact_model.dart';
import 'package:speak_live_go/features/contacts/presentation/widgets/call_contact_widget.dart';
import 'package:speak_live_go/features/contacts/presentation/widgets/contacts_list_skeleton.dart';

class CallsPage extends StatelessWidget {
  const CallsPage({
    required this.items,
    required this.onItemTap,
    super.key,
  });

  final List<ContactModel> items;
  final ValueChanged<ContactModel> onItemTap;

  @override
  Widget build(BuildContext context) {
    return ContactsListSkeleton(
      itemBuilder: (context, index) {
        final item = items[index];
        return CallContactWidget(
          item: items[index],
          onTap: () {
            onItemTap.call(item);
          },
        );
      },

      length: items.length,
    );
  }
}
