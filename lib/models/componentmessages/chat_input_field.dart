import 'package:flutter/material.dart';

class ChatInputField extends StatelessWidget {
  const ChatInputField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 4),
              blurRadius: 32.0,
            )
          ]),
      child: SafeArea(
        child: Row(
          children: [
            Icon(Icons.mic, color: Colors.blue),
            SizedBox(width: 20.0),
            Expanded(
                child: Container(
              padding: EdgeInsets.symmetric(horizontal: 15.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40.0),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.sentiment_satisfied_alt_outlined,
                  ),
                  SizedBox(width: 5.0),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                          hintText: "Type Here", border: InputBorder.none),
                    ),
                  ),
                  Icon(Icons.attach_file),
                  SizedBox(width: 5.0),
                  Icon(
                    Icons.camera_alt_outlined,
                  ),
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
