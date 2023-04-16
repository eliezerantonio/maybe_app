import 'package:flutter/material.dart';
import 'package:maybe_app/domain/entities/message_entity.dart';
import 'package:maybe_app/presentation/providers/chat_provider.dart';
import 'package:provider/provider.dart';
import '../../components/shared/components/components.dart';
import '/presentation/components/chat/components.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
                'https://www.rollingstone.com/wp-content/uploads/2019/11/CamilaCabello.jpg?w=1581&h=1054&crop=1'),
          ),
        ),
        title: const Text('Camilla '),
        centerTitle: false,
      ),
      body: const _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {
  const _ChatView();

  @override
  Widget build(BuildContext context) {
    final chatProvider = context.watch<ChatProvider>();

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
                child: ListView.builder(
              controller: chatProvider.controller,
              itemCount: chatProvider.messageList.length,
              itemBuilder: (context, index) {
                final message = chatProvider.messageList[index];

                return (message.fromWho == FromWho.hers)
                    ? HerMessageBubble(message: message)
                    : MyMessageBubble(
                        message: message,
                      );
              },
            )),
            MessageFieldBox(
              onValue: chatProvider.sendMessage,
            )
          ],
        ),
      ),
    );
  }
}
