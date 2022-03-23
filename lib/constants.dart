import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

const primarycolor = Color.fromRGBO(143, 148, 251, 1);
const kErrorColor = Color(0xFFF03738);
const color1 = Colors.green;

class Prefs {
  Future addStringToSF(String key, String val) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, val);
  }

  Future<String?> getStringValuesSF(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final image = prefs.getString(key);
    return image;
  }

  Future addBooleanToSF(String key, bool val) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(key, val);
  }
}
