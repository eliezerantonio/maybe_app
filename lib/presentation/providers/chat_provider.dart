import 'package:flutter/material.dart';
import 'package:maybe_app/config/helpers/get_no_abswer.dart';
import 'package:maybe_app/domain/entities/message_entity.dart';

class ChatProvider extends ChangeNotifier {
  final controller = ScrollController();
  final getYesNoAnser = GetYesNoAnswer();

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

    if (text.endsWith('?')) {
      await herReply();
    }

    notifyListeners();
    moveScrollToBottom();
  }

  Future<void> herReply() async {
    final herMessage = await getYesNoAnser.getAnswer();
    messageList.add(herMessage);
    notifyListeners();
    moveScrollToBottom();
  }

  Future<void> moveScrollToBottom() async {
    await Future.delayed(const Duration(milliseconds: 100));
    controller.animateTo(
      controller.position.maxScrollExtent,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }
}
