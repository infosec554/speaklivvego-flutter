part of 'chat_provider.dart';



class ChatState extends Equatable {
  const ChatState({
    this.items = const [],
  });

  ChatState copyWith({
    List<MessageModel>? items,
  }) =>
      ChatState(
        items: items ?? this.items,
      );

  final List<MessageModel> items;

  @override
  List<Object?> get props =>
      [
        items,
      ];
}
