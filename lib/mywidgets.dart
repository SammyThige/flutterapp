import 'package:flutter/material.dart';
import 'package:lost_n_found/constants.dart';

SnackBar mySnackBar(String message) {
  return SnackBar(
      backgroundColor: Colors.blue,
      content: Text(
        message,
        textAlign: TextAlign.center,
      ));
}

class DialogBuilder {
  DialogBuilder(this.context);

  final BuildContext context;

  void showLoadingIndicator(String text, String header) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return WillPopScope(
            onWillPop: () async => false,
            child: AlertDialog(
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8.0))),
              backgroundColor: Colors.deepOrange,
              content: LoadingIndicator(text: text, header: header),
            ));
      },
    );
  }

  void hideOpenDialog() {
    Navigator.of(context).pop();
  }
}

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({this.text = '', this.header = ''});

  final String text;
  final String header;

  @override
  Widget build(BuildContext context) {
    var displayedText = text;
    var headerText = header;
    return Container(
        padding: EdgeInsets.all(16),
        color: Colors.grey,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              _getLoadingIndicator(),
              _getHeading(context, headerText),
              _getText(displayedText)
            ]));
  }

  Padding _getLoadingIndicator() {
    return Padding(
        child: Container(
            child: CircularProgressIndicator(
              strokeWidth: 3,
              color: Colors.deepOrange,
            ),
            width: 32,
            height: 32),
        padding: const EdgeInsets.only(bottom: 16));
  }

  Widget _getHeading(context, String headerText) {
    return Padding(
        child: Text(
          headerText,
          textAlign: TextAlign.center,
        ),
        padding: const EdgeInsets.only(bottom: 4));
  }

  Text _getText(String displayedText) {
    return Text(
      displayedText,
      textAlign: TextAlign.center,
    );
  }
}

Widget myTextField(String hint, TextEditingController con) {
  return Container(
    padding: EdgeInsets.only(top: 20.0, bottom: 20.0, right: 5.0, left: 5.0),
    child: (TextField(
        controller: con,
        decoration: InputDecoration(
            hintText: "eg. White earphones",
            hintStyle: TextStyle(color: Colors.blue[400]),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(30.0)),
            labelText: hint))),
  );
}

Widget locationTextField(String hint, TextEditingController con) {
  return Container(
    padding: EdgeInsets.only(bottom: 20.0, right: 5.0, left: 5.0),
    child: (TextField(
        controller: con,
        decoration: InputDecoration(
            hintText: "eg. Dining Hall",
            hintStyle: TextStyle(color: Colors.blue[400]),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(30.0)),
            labelText: hint))),
  );
}
