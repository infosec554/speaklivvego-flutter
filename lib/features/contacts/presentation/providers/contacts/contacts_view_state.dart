part of 'contacts_view_provider.dart';

class ContactsViewState extends Equatable {
  const ContactsViewState({
    required this.calls,
    required this.friends,
    required this.blocked,
    this.currentTab = TabOfContactsEnum.calls,
  });

  ContactsViewState copyWith({
    List<ContactModel>? calls,
    List<ContactModel>? friends,
    List<ContactModel>? blocked,
    TabOfContactsEnum? currentTab,
  }) => ContactsViewState(
    calls: calls ?? this.calls,
    currentTab: currentTab ?? this.currentTab,
    friends: friends ?? this.friends,
    blocked: blocked ?? this.blocked,
  );

  final List<ContactModel> calls;
  final List<ContactModel> friends;
  final List<ContactModel> blocked;
  final TabOfContactsEnum currentTab;

  @override
  List<Object?> get props => [
    calls,
    currentTab,
    friends,
    blocked,
  ];
}
