import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:speak_live_go/features/common/presentation/widgets/app_app_bar.dart';
import 'package:speak_live_go/features/contacts/presentation/pages/blockeds_page.dart';
import 'package:speak_live_go/features/contacts/presentation/pages/calls_page.dart';
import 'package:speak_live_go/features/contacts/presentation/pages/friends_page.dart';
import 'package:speak_live_go/features/contacts/presentation/providers/contacts/contacts_view_provider.dart';
import 'package:speak_live_go/features/contacts/presentation/widgets/tabs_of_contacts.dart';

class ContactsView extends ConsumerStatefulWidget {
  const ContactsView({super.key});

  @override
  ConsumerState<ContactsView> createState() => _ContactsViewState();
}

class _ContactsViewState extends ConsumerState<ContactsView> {
  late final PageController pageController = PageController();

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(contactsViewProvider);
    final notifier = ref.read(contactsViewProvider.notifier);
    return Scaffold(
      appBar: AppAppBar(
        title: 'Contacts',
        addToHeight: 50,
        bottom: TabsOfContacts(
          current: state.currentTab,
          onChanged: (v) async {
            await pageController.animateToPage(
              v.index,
              duration: const Duration(milliseconds: 300),
              curve: Curves.ease,
            );
            notifier.updateState(state.copyWith(currentTab: v));
          },
        ),
      ),
      body: PageView(
        physics: const BouncingScrollPhysics(),
        onPageChanged: notifier.onPageViewChanged,
        controller: pageController,
        children: [
          /// calls
          CallsPage(
            items: state.calls,
            onItemTap: (v) {},
          ),

          /// friends
          FriendsPage(
            items: state.friends,
            onItemTap: (v) {},
            onRemove: (v) {},
          ),

          /// blocked
          BlockedContactsPage(
            items: state.blocked,
            onItemTap: (v) {},
            onUnlock: (v) {},
          ),
        ],
      ),
    );
  }
}
