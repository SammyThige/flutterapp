import 'package:flutter/material.dart';
import 'package:lost_n_found/fPage/homedashpage.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: buildAppBar(),
      body: HomeDash(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      title: Center(child: Text("DashBoard")),
      elevation: 0,
      /* leading: IconButton(
        onPressed: () {},
        icon: Icon(Icons.align_horizontal_left_sharp),
      ), */
    );
  }
}
