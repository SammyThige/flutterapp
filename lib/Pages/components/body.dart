//import 'dart:html';

import 'package:flutter/material.dart';
import 'package:lost_n_found/Pages/components/chart_card.dart';
import 'package:lost_n_found/constants.dart';
import 'package:lost_n_found/models/chat.dart';
import 'package:lost_n_found/models/messages.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /* Container(
            padding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20.0),
            color: Colors.white,
            child: Row(
              children: [
                ElevatedButton(
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ))),
                  onPressed: () {},
                  child: Text(
                    "Recent",
                    style: TextStyle(color: Colors.black), 
                  ),
                )
              ],
            )), */
        Expanded(
            child: ListView.builder(
          itemCount: chatsData.length,
          shrinkWrap: true,
          itemBuilder: (context, index) => ChatCard(
              chat: chatsData[index],
              press: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Messages()))),
        ))
      ],
    );
  }
}
