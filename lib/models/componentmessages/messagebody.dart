import 'package:flutter/material.dart';
import 'package:lost_n_found/models/chartmessage.dart';
import 'package:lost_n_found/models/componentmessages/chat_input_field.dart';
import 'package:lost_n_found/models/componentmessages/message.dart';
import 'package:lost_n_found/models/componentmessages/textmessage.dart';

class MessageBody extends StatelessWidget {
  const MessageBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: ListView.builder(
            itemCount: demeChatMessages.length,
            itemBuilder: (context, index) => Message(
              message: demeChatMessages[index],
            ),
          ),
        )),
        ChatInputField()
      ],
    );
  }
}
