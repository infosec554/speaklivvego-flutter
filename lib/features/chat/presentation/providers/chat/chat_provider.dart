import 'package:equatable/equatable.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:speak_live_go/features/chat/data/models/message_model.dart';

part 'chat_state.dart';

final chatProvider = AutoDisposeNotifierProvider<ChatNotifier, ChatState>(
  ChatNotifier.new,
);

class ChatNotifier extends AutoDisposeNotifier<ChatState> {
  void updateState(ChatState v) {
    state = v;
  }

  @override
  ChatState build() {
    return ChatState(
      items: List.generate(
        12,
        MessageModel.getMock,
      ),
    );
  }
}
