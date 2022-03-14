import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:lost_n_found/registrationscreen.dart';
import 'package:lost_n_found/fPage/dashboard.dart';
import 'package:lost_n_found/mywidgets.dart';
import 'package:http/http.dart' as http;

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = TextEditingController();
  late ScaffoldMessengerState scaffoldMessenger;
  //final textfl = new Registration();
  @override
  Widget build(BuildContext context) {
    scaffoldMessenger = ScaffoldMessenger.of(context);

    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 400,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/lf1.png"), fit: BoxFit.fill),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(5.0),
              child: Column(children: <Widget>[
                Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                            color: Color.fromRGBO(143, 148, 251, 1),
                            blurRadius: 20.0,
                            offset: Offset(10, 10))
                      ]),
                  child: Column(children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
                      decoration: BoxDecoration(
                          border:
                              Border(bottom: BorderSide(color: Colors.grey))),
                      child: TextField(
                        controller: emailController,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            labelText: "Email or Phone Number",
                            labelStyle: TextStyle(color: Colors.blue[400])),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
                      child: TextField(
                        obscureText: true,
                        obscuringCharacter: "*",
                        controller: passwordController,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            labelText: "Password",
                            labelStyle: TextStyle(color: Colors.blue[400])),
                      ),
                    )
                  ]),
                ),
                SizedBox(
                  height: 30,
                ),
                GestureDetector(
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          gradient: LinearGradient(colors: [
                            Color.fromRGBO(143, 148, 251, 1),
                            Color.fromRGBO(143, 148, 251, 6)
                          ])),
                      child: Center(
                        child: Text(
                          "Login",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    onTap: () {
                      loginFunction();
                    }),
                SizedBox(
                  height: 30,
                ),
                GestureDetector(
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
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
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  Registration()));
                    }),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    child: Text(
                      "Forgot Password?",
                      style: TextStyle(color: Color.fromRGBO(143, 148, 251, 1)),
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  Registration()));
                    },
                  ),
                )
              ]),
            )
          ],
        ),
      ),
    );
  }

  void loginFunction() {
    if (passwordController.text.isEmpty && emailController.text.isEmpty) {
      scaffoldMessenger.showSnackBar(
        mySnackBar("Provide Email and Password"),
      );

      return;
    } else if (passwordController.text.isEmpty) {
      scaffoldMessenger.showSnackBar(
        mySnackBar("Provide Password"),
      );
      return;
    } else if (emailController.text.isEmpty) {
      //call sigin function
      scaffoldMessenger.showSnackBar(
        mySnackBar("Provide Email"),
      );
      return;
    } else {
      signIn(emailController.text, passwordController.text);
     /*  Navigator.push(context,
          MaterialPageRoute(builder: (BuildContext context) => DashBoard()),
          ); */
    }
  }

  signIn(String email, password) async {
    DialogBuilder(context).showLoadingIndicator(
        "Please wait as we authenticate you", "Authentication");
    Map data = {'email': email, 'password': password};
    var jsonResponse;
    var response = await http.post(
        Uri.parse("https://sam-thige.000webhostapp.com/login.php"),
        body: data);
    if (response.statusCode == 200) {
      jsonResponse = json.decode(response.body);
      if (jsonResponse != null) {
        setState(() {
          DialogBuilder(context).hideOpenDialog();
        });
        int isRegistered = jsonResponse['code'];
        if (isRegistered == 1) {
          //correct password
          //move to dashboard
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => DashBoard()));
        } else {
          //wrongpassword use SnackBar to Show
          scaffoldMessenger.showSnackBar(
            mySnackBar("Wrong Password"),
          );
        }
      }
    } else {
      setState(() {
        DialogBuilder(context).hideOpenDialog();
      });
    }
  }
}
