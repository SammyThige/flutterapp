import 'package:flutter/material.dart';

class MessageBody extends StatelessWidget {
  const MessageBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Spacer(),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
          ),
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
                      Icon(
                        Icons.camera_alt_outlined,
                      ),
                    ],
                  ),
                ))
              ],
            ),
          ),
        )
      ],
    );
  }
}
