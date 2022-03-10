import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:lost_n_found/Pages/chats.dart';
import 'package:lost_n_found/Pages/new.dart';
import 'package:lost_n_found/Pages/searchpage.dart';
import 'package:lost_n_found/fPage/bodydash.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  int index = 0;
  final screens = [Body(), Search(), New_Post(), Chats()];

  final items = <Widget>[
    Icon(
      Icons.home,
      size: 25,
    ),
    Icon(
      Icons.search,
      size: 25,
    ),
    Icon(
      Icons.add_circle,
      size: 25,
    ),
    Icon(
      Icons.chat_bubble,
      size: 25,
    )
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        //backgroundColor: Colors.red,
        // extendBody: true,
        /* appBar: AppBar(
          backgroundColor: Color.fromRGBO(143, 148, 251, 1),
        ), */
        body: screens[index],
        bottomNavigationBar: CurvedNavigationBar(
            backgroundColor: Colors.transparent,
            height: 60,
            animationCurve: Curves.easeInOut,
            animationDuration: Duration(milliseconds: 300),
            buttonBackgroundColor: Colors.amber,
            color: Color.fromRGBO(143, 148, 251, 1),
            index: index,
            items: items,
            onTap: (index) => setState(() => this.index = index)));
  }
}
