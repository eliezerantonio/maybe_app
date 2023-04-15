import 'package:flutter/material.dart';

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
        title: const Text('My Love  🥰'),
        centerTitle: false,
      ),
    );
  }
}
