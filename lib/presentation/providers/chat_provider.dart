import 'package:flutter/material.dart';
import 'package:maybe_app/domain/entities/message_entity.dart';

class ChatProvider extends ChangeNotifier {
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


  Future<void> sendMessage(String text)async{

  }
}
