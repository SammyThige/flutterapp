import 'package:flutter/material.dart';
import 'package:lost_n_found/models/componentmessages/messagebody.dart';

class Messages extends StatelessWidget {
  const Messages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: MessageBody(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Row(
        children: [
          BackButton(),
          CircleAvatar(
            backgroundImage: AssetImage("assets/portrait5.jpg"),
          ),
          SizedBox(
            width: 15.0,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Kristin Watson",
                style: TextStyle(fontSize: 16),
              ),
              Text("Online", style: TextStyle(fontSize: 13))
            ],
          )
        ],
      ),
      actions: [IconButton(onPressed: () {}, icon: Icon(Icons.local_phone))],
    );
  }
}
