import 'package:json_annotation/json_annotation.dart';
import 'package:speak_live_go/core/routing/codec/models/base/base_extra_model.dart';

part 'chat_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class ChatModel extends BaseExtraModel {
  const ChatModel({
    required this.name,
    required this.isOnline,
    required this.minute,
    required this.id,
    required this.callCount,
    required this.motto,
  });

  factory ChatModel.fromJson(Map<String, dynamic> json) =>
      _$ChatModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ChatModelToJson(this);
  final int minute;
  final String name;
  final String motto;
  final bool isOnline;
  final int id;
  final int? callCount;

  List<Object?> get props => [
    name,
    isOnline,
    motto,
    minute,
    id,
    callCount,
  ];

  static ChatModel getMock(int index) => ChatModel(
    motto: 'Hi! What is your name?',
    name: 'Name $index',
    callCount: index.isEven ? 6 : null,

    isOnline: index.isEven,
    minute: (index * 10) % 34,
    id: index,
  );

  String get getMinuteWithPrefix => '$minute min';

  @override
  String get getClassName => '$runtimeType';
}
