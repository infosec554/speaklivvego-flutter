import 'package:equatable/equatable.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:speak_live_go/features/chats/data/models/chat/chat_model.dart';

part 'chats_state.dart';

final chatsProvider = AutoDisposeNotifierProvider<ChatsNotifier, ChatsState>(
  ChatsNotifier.new,
);

class ChatsNotifier extends AutoDisposeNotifier<ChatsState> {
  void updateState(ChatsState v) {
    state = v;
  }

  @override
  ChatsState build() {
    return ChatsState(items: List.generate(24, ChatModel.getMock));
  }
}
