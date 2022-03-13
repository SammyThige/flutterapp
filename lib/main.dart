import 'package:flutter/material.dart';
import 'package:lost_n_found/loginpage.dart';
import 'package:lost_n_found/theme.dart';
import 'package:lost_n_found/theme.dart';

/* void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Homepage(),
    )); */

void main() => runApp(MainPage());

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //theme: lightThemeData(context),
      //darkTheme: darkThemeData(context),
      home: Scaffold(
        resizeToAvoidBottomInset: true,
        body: Homepage(),
      ),
    );
  }
}
