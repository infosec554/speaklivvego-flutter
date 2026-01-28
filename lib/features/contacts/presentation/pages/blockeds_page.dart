import 'package:flutter/material.dart';
import 'package:speak_live_go/features/contacts/data/models/contact/contact_model.dart';
import 'package:speak_live_go/features/contacts/presentation/widgets/contacts_list_skeleton.dart';
import 'package:speak_live_go/features/contacts/presentation/widgets/friend_on_not_friend_contact_widget.dart';

class BlockedContactsPage extends StatelessWidget {
  const BlockedContactsPage({
    required this.items,
    required this.onItemTap,
    required this.onUnlock,
    super.key,
  });

  final List<ContactModel> items;
  final ValueChanged<ContactModel> onItemTap;
  final ValueChanged<ContactModel> onUnlock;

  @override
  Widget build(BuildContext context) {
    return ContactsListSkeleton(
      itemBuilder: (context, index) {
        final item = items[index];
        return FriendOrNotFriendWidget(
          item: items[index],
          onTap: () {
            onItemTap.call(item);
          },
          onAction: () => onUnlock.call(item),
        );
      },
      length: items.length,
    );
  }
}
