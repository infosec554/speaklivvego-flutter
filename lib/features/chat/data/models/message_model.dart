import 'package:equatable/equatable.dart';

class MessageModel extends Equatable {
  const MessageModel({
    required this.content,
    required this.id,
    required this.isMine,
    required this.date,
  });

  final String content;
  final int id;
  final bool isMine;
  final DateTime date;

  @override
  List<Object?> get props => [
    content,
    id,
    isMine,
    date,
  ];

  static MessageModel getMock(int index) => MessageModel(
    content: index.isEven
        ? 'Hi, I just wanna know that how much time you’ll be updated.'
        : 'Maybe, Nearly July, 2022',
    id: index,
    isMine: index.isEven,
    date: DateTime.now(),
  );

}
