import 'package:flutter/material.dart';
import 'package:lost_n_found/registrationscreen.dart';
import 'package:lost_n_found/fPage/dashboard.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  //final textfl = new Registration();
  @override
  Widget build(BuildContext context) {
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
                            offset: Offset(0, 10))
                      ]),
                  child: Column(children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
                      decoration: BoxDecoration(
                          border:
                              Border(bottom: BorderSide(color: Colors.grey))),
                      child: TextField(
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            labelText: "Email or Phone Number",
                            labelStyle: TextStyle(color: Colors.blue[400])),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
                      child: TextField(
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
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) => DashBoard()));
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
}
