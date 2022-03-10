import 'dart:ui';

import 'package:flutter/material.dart';

class Search extends StatelessWidget {
  const Search({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Text(
        "Search Page",
        style: TextStyle(fontSize: 40, color: Colors.deepOrange),
      )),
    );
  }
}
