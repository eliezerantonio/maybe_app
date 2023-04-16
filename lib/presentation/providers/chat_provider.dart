import 'package:flutter/material.dart';
import 'package:maybe_app/domain/entities/message_entity.dart';

class ChatProvider extends ChangeNotifier {
  final controller = ScrollController();
  List<MessageEntity> messageList = [
    MessageEntity(
      text: 'hi Camilla',
      fromWho: FromWho.me,
    ),
    MessageEntity(
      text: 'Ja voltou do traabalho?',
      fromWho: FromWho.me,
    ),
  ];

  Future<void> sendMessage(String text) async {
    if (text.isEmpty) return;
    final newMessage = MessageEntity(
      text: text,
      fromWho: FromWho.me,
    );

    messageList.add(newMessage);

    notifyListeners();
    moveScrollToBottom();
  }

  void moveScrollToBottom() {
    controller.animateTo(
      controller.position.maxScrollExtent,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }
}
