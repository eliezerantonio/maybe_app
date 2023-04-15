import 'package:flutter/material.dart';

class MessageFieldBox extends StatelessWidget {
  const MessageFieldBox({super.key, required this.onValue});

  final ValueChanged<String> onValue;
  @override
  Widget build(BuildContext context) {
    final textController = TextEditingController();
    final focusNode = FocusNode();

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
        onValue(value);
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
            onValue(textValue);
          },
          icon: const Icon(
            Icons.send_outlined,
          ),
        ),
      ),
    );
  }
}
