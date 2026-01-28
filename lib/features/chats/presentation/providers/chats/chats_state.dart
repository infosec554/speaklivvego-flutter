part of 'chats_provider.dart';


class ChatsState extends Equatable {
  const ChatsState({ 
    this.items = const [],
  });

  ChatsState copyWith({
    List<ChatModel>? items,
  }) =>
      ChatsState(
        items: items ?? this.items, 
      );
 
  final List<ChatModel> items;

 
 

  @override
  List<Object?> get props => [ 
        items, 
      ];
}
