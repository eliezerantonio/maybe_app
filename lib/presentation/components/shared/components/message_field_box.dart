import 'package:flutter/material.dart';

class MessageFieldBox extends StatelessWidget {
  MessageFieldBox({super.key});

  final textController = TextEditingController();
  final focusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    final outlineInput = UnderlineInputBorder(
      borderSide: const BorderSide(color: Colors.transparent),
      borderRadius: BorderRadius.circular(40),
    );

    return TextFormField(
      onTapOutside: (event) {
        focusNode.unfocus();
      },
      focusNode: focusNode,
      controller: textController,
      onFieldSubmitted: (value) {
        textController.clear();
        focusNode.requestFocus();
      },
      decoration: InputDecoration(
        hintText: 'Escreva uma mensagem',
        enabledBorder: outlineInput,
        focusedBorder: outlineInput,
        filled: true,
        suffixIcon: IconButton(
          onPressed: () {
            final textValue = textController.text;
            textController.clear();
          },
          icon: const Icon(
            Icons.send_outlined,
          ),
        ),
      ),
    );
  }
}
