import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class New_Post extends StatefulWidget {
  const New_Post({Key? key}) : super(key: key);

  @override
  State<New_Post> createState() => _New_PostState();
}

class _New_PostState extends State<New_Post> {
  late File _image;

  Future getImage() async {
    //final image = await ImagePicker.pickImage(source: ImageSource.camera);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("New Post"),
      ),
      body: Center(
        child: Container(
          child: GestureDetector(
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: Color.fromARGB(251, 105, 111, 216),
                          blurRadius: 20.0,
                          offset: Offset(0, 10))
                    ],
                    borderRadius: BorderRadius.circular(10),
                    gradient: LinearGradient(colors: [
                      Color.fromRGBO(143, 148, 251, 1),
                      Color.fromRGBO(143, 148, 251, 6)
                    ])),
                child: Center(
                  child: Text(
                    "Create Account",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              onTap: () {}),
        ),
      ),
    );
  }
}
