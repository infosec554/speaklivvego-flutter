import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:speak_live_go/features/chat/presentation/providers/chat/chat_provider.dart';
import 'package:speak_live_go/features/chat/presentation/widgets/chat_app_bar.dart';
import 'package:speak_live_go/features/chat/presentation/widgets/chat_text_field.dart';
import 'package:speak_live_go/features/chat/presentation/widgets/message_widget.dart';
import 'package:speak_live_go/features/chats/data/models/chat/chat_model.dart';
import 'package:speak_live_go/features/common/presentation/widgets/app_gap.dart';

class ChatPage extends ConsumerStatefulWidget {
  const ChatPage(
    this.item, {
    super.key,
  });

  final ChatModel item;

  @override
  ConsumerState<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends ConsumerState<ChatPage> {
  late TextEditingController controller;

  @override
  void initState() {
    controller = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(chatProvider);
    final notifier = ref.read(chatProvider.notifier);
    return Scaffold(
      extendBody: true,
      body: Column(
        children: [
          ChatAppBar(item: widget.item, onCall: () {}, onMore: () {}),
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              itemBuilder: (context, index) {
                final item = state.items[index];

                return MessageWidget(item: item);
              },
              separatorBuilder: (_, _) => const HBox(12),
              itemCount: state.items.length,
            ),
          ),
        ],
      ),
      bottomNavigationBar: ChatTextField(
        controller: controller,
        onSend: () {},
      ),
    );
  }
}
