import 'package:flutter/material.dart';
import 'package:lost_n_found/Pages/new.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:lost_n_found/mywidgets.dart';
import 'package:lost_n_found/Pages/AddingItems/founditems.dart';

class FoundItems extends StatefulWidget {
  const FoundItems({Key? key}) : super(key: key);

  @override
  State<FoundItems> createState() => _FoundItemsState();
}

class _FoundItemsState extends State<FoundItems> {
  dynamic file;
  TextEditingController desc = TextEditingController();
  TextEditingController location = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            title: const Text("Image Picker"),
          ),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Center(
              child: Column(
                children: [
                  Center(
                    child: Row(
                      children: [
                        Padding(
                          padding:
                              const EdgeInsets.only(left: 45.0, right: 50.0),
                          child: ElevatedButton(
                            style: ButtonStyle(
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(18.0),
                                        side: BorderSide(color: Colors.blue)))),
                            onPressed: () {
                              imagePicker();
                            },
                            child: const Text("Select Image"),
                          ),
                        ),
                        ElevatedButton(
                          style: ButtonStyle(
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18.0),
                                      side: BorderSide(color: Colors.blue)))),
                          onPressed: () {
                            cameraPicker();
                          },
                          child: const Text("Take Picture"),
                        ),
                      ],
                    ),
                  ),
                  if (file != null)
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Image.file(file,
                          width: double.infinity,
                          height: 250,
                          fit: BoxFit.cover),
                    ),
                  myTextField("Item Description", desc),
                  locationTextField("Where item was found", location),
                  ElevatedButton(
                    style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                    side: BorderSide(color: Colors.blue)))),
                    onPressed: () {
                      cameraPicker();
                    },
                    child: const Text("Upload Item"),
                  ),
                ],
              ),
            ),
          ),
        ));
  }

  void imagePicker() async {
    XFile? image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        file = File(image.path);
      });
    }
  }

  void cameraPicker() async {
    XFile? image = await ImagePicker().pickImage(source: ImageSource.camera);
    if (image != null) {
      setState(() {
        file = File(image.path);
      });
    }
  }
}
