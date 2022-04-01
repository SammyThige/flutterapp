import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lost_n_found/Pages/AddingItems/founditems.dart';
import 'package:lost_n_found/Pages/AddingItems/lostitems.dart';

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
    return Scaffold(body: LostItems());
  }
}
