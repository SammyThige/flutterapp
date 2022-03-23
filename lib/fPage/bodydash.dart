import 'package:flutter/material.dart';
import 'package:lost_n_found/fPage/homedashpage.dart';
import 'package:lost_n_found/loginpage.dart';
import 'package:lost_n_found/constants.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  late var logginuser;
  final Prefs _prefs = Prefs();

  @override
  Widget build(BuildContext context) {
    _prefs.getStringValuesSF('fname').then((firstname) => {
          setState(() {
            logginuser = firstname;
          })
        });
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: buildAppBar(),
      body: HomeDash(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      title: Center(child: Text(logginuser)),
      elevation: 0,
      leading: Padding(
        padding: EdgeInsets.only(left: 5),
        child: Image.network("https://sam-thige.000webhostapp.com/productimages/john.jpg")
      ),
      /* leading: IconButton(
        onPressed: () {},
        icon: Icon(Icons.align_horizontal_left_sharp),
      ), */
    );
  }
}
