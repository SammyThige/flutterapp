import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:lost_n_found/mywidgets.dart';
import 'package:http/http.dart' as http;
import 'package:lost_n_found/testingscreen/homepage.dart' as mypage;
import 'package:lost_n_found/constants.dart';

bool isFoundSelected = true;

class LostItems extends StatefulWidget {
  const LostItems({Key? key}) : super(key: key);

  @override
  State<LostItems> createState() => _LostItemsState();
}

class _LostItemsState extends State<LostItems> {
  dynamic file;
  dynamic file1;
  TextEditingController desc = TextEditingController();
  TextEditingController location = TextEditingController();
  late var logginuser;
  final Prefs _prefs = Prefs();
  @override
  Widget build(BuildContext context) {
    _prefs.getStringValuesSF('fname').then((firstname) => {
      setState(() {
        logginuser = firstname;
      })
    });
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: Colors.white70,
          /* appBar: AppBar(
              //title: const Text("Image Picker"),
              ), */

          body: SingleChildScrollView(
            child: Column(children: [
              SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.blueAccent),
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0xFFD4E7FE)),
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  child: Column(
                    children: [
                      Container(
                          alignment: Alignment.centerRight,
                          child: RichText(
                            text: TextSpan(
                                text: "Wed",
                                style: TextStyle(
                                    color: Color(0xFF263064),
                                    //fontFamily: ,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w900),
                                children: [
                                  TextSpan(
                                      text: " 10 Oct",
                                      style: TextStyle(
                                          color: Color(0xFF263064),
                                          fontSize: 12,
                                          fontWeight: FontWeight.normal))
                                ]),
                          )),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 1, color: Colors.white),
                                    borderRadius: BorderRadius.circular(15),
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: AssetImage("assets/emoji.png"),
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                          color:
                                              Colors.blueGrey.withOpacity(0.2),
                                          blurRadius: 12,
                                          spreadRadius: 8)
                                    ])),
                            SizedBox(
                              height: 20,
                            ),
                            Column(
                              children: [
                                Text(
                                  " Hi $logginuser",
                                  style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.w900,
                                      color: Color(0XFF343E87)),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "   Found Something?",
                                  style: TextStyle(
                                      fontSize: 13, color: Colors.blueGrey),
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  "Post it here!",
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.blueGrey,
                                  ),
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: <Widget>[
                                    InkWell(
                                      child: mypage.ChoiceChip(
                                          icon:Icons.add_reaction,text:"Found Item",isSelected: isFoundSelected),
                                      onTap: () {
                                        setState(() => isFoundSelected = true);
                                        // showFoundItems();
                                      },
                                    ),
                                    const SizedBox(width: 20.0),
                                    InkWell(
                                      child: mypage.ChoiceChip(
                                          text: 'Lost Item', icon: Icons.add_moderator_sharp, isSelected: !isFoundSelected),
                                      onTap: (){
                                        setState(() => isFoundSelected=false);
                                        //showLostItems();
                                      },
                                    ),
                                  ],
                                )
                              ],
                            )
                          ]),
                    ],
                  ),
                ),
              ),
              if (isFoundSelected) postFoundItem() else postLostItem(),
            ]),
          ),
        ));
  }
 postFoundItem  () {
    return Container (
  margin: EdgeInsets.all(8.0),
  padding: EdgeInsets.all(3.0),
  decoration: BoxDecoration(
    image: DecorationImage(
        image: AssetImage("assets/bg4.gif"), fit: BoxFit.cover),
    border: Border.all(color: Colors.blueAccent),
    borderRadius: BorderRadius.circular(10),
  ),
  child: Padding(
    padding: const EdgeInsets.all(15.0),
    child: Center(
      child: Column(
        children: [
          Center(
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      left: 15.0, right: 65.0),
                  child: ElevatedButton(
                    style: ButtonStyle(
                        shape: MaterialStateProperty.all<
                            RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                                borderRadius:
                                BorderRadius.circular(18.0),
                                side: BorderSide(
                                    color: Colors.blue)))),
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
                              borderRadius:
                              BorderRadius.circular(18.0),
                              side: BorderSide(
                                  color: Colors.blue)))),
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
                shape: MaterialStateProperty.all<
                    RoundedRectangleBorder>(
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
);
  }

   postLostItem  () {
    return Container (
    margin: EdgeInsets.all(8.0),
    padding: EdgeInsets.all(3.0),
    decoration: BoxDecoration(
      image: DecorationImage(
          image: AssetImage("assets/background.gif"), fit: BoxFit.cover),
      border: Border.all(color: Colors.blueAccent),
      borderRadius: BorderRadius.circular(10),
    ),
    child: Padding(
      padding: const EdgeInsets.all(15.0),
      child: Center(
        child: Column(
          children: [
            Center(
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 15.0, right: 65.0),
                    child: ElevatedButton(
                      style: ButtonStyle(
                          shape: MaterialStateProperty.all<
                              RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                  borderRadius:
                                  BorderRadius.circular(18.0),
                                  side: BorderSide(
                                      color: Colors.blue)))),
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
                                borderRadius:
                                BorderRadius.circular(18.0),
                                side: BorderSide(
                                    color: Colors.blue)))),
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
                  shape: MaterialStateProperty.all<
                      RoundedRectangleBorder>(
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
  );
  }

  void imagePicker() async {
    XFile? image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        file = File(image.path);
        file1 = File(image.name);
      });
    }
  }

  void cameraPicker() async {
    XFile? image = await ImagePicker().pickImage(source: ImageSource.camera);
    if (image != null) {
      setState(() {
        file = File(image.path);
        file1 = File(image.name);
      });
    }
  }
}
