import 'package:flutter/material.dart';
import 'package:speak_live_go/features/contacts/data/models/contact/contact_model.dart';
import 'package:speak_live_go/features/contacts/presentation/widgets/contacts_list_skeleton.dart';
import 'package:speak_live_go/features/contacts/presentation/widgets/friend_on_not_friend_contact_widget.dart';

class FriendsPage extends StatelessWidget {
  const FriendsPage({
    required this.items,
    required this.onItemTap,
    required this.onRemove,
    super.key,
  });

  final List<ContactModel> items;
  final ValueChanged<ContactModel> onItemTap;
  final ValueChanged<ContactModel> onRemove;

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
          onAction: () => onRemove.call(item),
        );
      },
      length: items.length,
    );
  }
}
