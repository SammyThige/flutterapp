import 'package:flutter/material.dart';
import 'package:lost_n_found/loginpage.dart';

class Registration extends StatefulWidget {
  const Registration({Key? key}) : super(key: key);

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  TextEditingController fName = TextEditingController();
  TextEditingController sName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController cfrmpassword = TextEditingController();
  late ScaffoldMessengerState scaffoldMessenger;

  @override
  Widget build(BuildContext context) {
    scaffoldMessenger = ScaffoldMessenger.of(context);

    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: Color.fromRGBO(143, 148, 251, 1),
        title: Text(
          "Create Account",
          style: TextStyle(color: Colors.amber),
        ),
      ),
      body: Container(
          padding: EdgeInsets.only(left: 20.0, right: 20.0),
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/bg1.gif"), fit: BoxFit.cover)),
          child: Column(children: <Widget>[
            Positioned(
                child: Container(
              margin: EdgeInsets.only(top: 100),
            )),
            Container(
              padding: EdgeInsets.only(left: 20, right: 20),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                        color: Color.fromARGB(251, 105, 111, 216),
                        blurRadius: 20.0,
                        offset: Offset(0, 10))
                  ]),
              child: Column(children: <Widget>[
                Container(
                  padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
                  decoration: BoxDecoration(
                      border: Border(bottom: BorderSide(color: Colors.grey))),
                  child: TextField(
                    controller: fName,
                    decoration: InputDecoration(
                        icon: Icon(Icons.person_add),
                        border: InputBorder.none,
                        labelText: "First Name",
                        labelStyle: TextStyle(color: Colors.blue[400])),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
                  decoration: BoxDecoration(
                      border: Border(bottom: BorderSide(color: Colors.black))),
                  child: TextField(
                    controller: sName,
                    decoration: InputDecoration(
                        icon: Icon(Icons.person_add),
                        border: InputBorder.none,
                        labelText: "Last Name",
                        labelStyle: TextStyle(color: Colors.blue[400])),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
                  decoration: BoxDecoration(
                      border: Border(bottom: BorderSide(color: Colors.grey))),
                  child: TextField(
                    controller: email,
                    decoration: InputDecoration(
                        icon: Icon(Icons.email_rounded),
                        border: InputBorder.none,
                        hintText: "someone@gmail.com",
                        hintStyle: TextStyle(color: Colors.blue[400]),
                        labelText: "E-mail",
                        labelStyle: TextStyle(color: Colors.blue[400])),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
                  decoration: BoxDecoration(
                      border: Border(bottom: BorderSide(color: Colors.grey))),
                  child: TextField(
                    controller: password,
                    obscureText: true,
                    obscuringCharacter: "*",
                    decoration: InputDecoration(
                        icon: Icon(Icons.password_rounded),
                        border: InputBorder.none,
                        labelText: "Password",
                        labelStyle: TextStyle(color: Colors.blue[400])),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
                  child: TextField(
                    controller: cfrmpassword,
                    obscureText: true,
                    obscuringCharacter: "*",
                    decoration: InputDecoration(
                        icon: Icon(Icons.password_rounded),
                        border: InputBorder.none,
                        labelText: "Confirm Password",
                        labelStyle: TextStyle(color: Colors.blue[400])),
                  ),
                )
              ]),
            ),
            SizedBox(
              height: 60,
            ),
            GestureDetector(
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
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => Homepage()));
                })
          ])),
    );
  }
}
