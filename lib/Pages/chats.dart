import 'package:flutter/material.dart';
import 'package:lost_n_found/Pages/components/body.dart';
import 'package:lost_n_found/constants.dart';

class Chats extends StatelessWidget {
  const Chats({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: BuildAppBar(),
        body: /* Center(
          child: Text(
        "Chats Page",
        style: TextStyle(fontSize: 40, color: Colors.deepOrange),
      )), */
            Body());
  }

  AppBar BuildAppBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Text("Chats"),
      actions: [IconButton(onPressed: () {}, icon: Icon(Icons.search))],
    );
  }
}
