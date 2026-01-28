import 'package:equatable/equatable.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:speak_live_go/features/contacts/data/models/contact/contact_model.dart';
import 'package:speak_live_go/features/contacts/domain/enums/tab_of_contacts_enum.dart';

part 'contacts_view_state.dart';

final contactsViewProvider =
    AutoDisposeNotifierProvider<ContactsViewNotifier, ContactsViewState>(
      ContactsViewNotifier.new,
    );

class ContactsViewNotifier extends AutoDisposeNotifier<ContactsViewState> {
  void updateState(ContactsViewState v) {
    state = v;
  }

  @override
  ContactsViewState build() {
    final items = List.generate(
      12,
      ContactModel.getMock,
    );
    return ContactsViewState(
      calls: items,
      friends: items,
      blocked: List.generate(
        12,
        (index) => ContactModel.getMock(
          index,
          isBlocked: true,
        ),
      ),
    );
  }

  void onPageViewChanged(int v) {
    TabOfContactsEnum? tab;
    switch (v) {
      case 0:
        {
          tab = TabOfContactsEnum.calls;
          break;
        }
      case 1:
        {
          tab = TabOfContactsEnum.friends;
          break;
        }
      case 2:
        {
          tab = TabOfContactsEnum.blocked;
          break;
        }
    }
    updateState(
      state.copyWith(
        currentTab: tab,
      ),
    );
  }
}
