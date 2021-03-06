import 'package:flutter/material.dart';

class HeaderWithSearchBox extends StatelessWidget {
  const HeaderWithSearchBox({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20.0 * 2.5),
      height: size.height * 0.2,
      child: Stack(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(
              left: 20.0,
              right: 20.0,
              bottom: 56.0,
            ),
            height: size.height * 0.2 - 27,
            decoration: BoxDecoration(
                color: Color.fromRGBO(143, 148, 251, 1),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(36),
                  bottomRight: Radius.circular(36),
                )),
            child: Row(
              children: <Widget>[
                Text(
                  "Hi Thige",
                  style: Theme.of(context).textTheme.headline5!.copyWith(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                Spacer(),
                Image.asset("assets/logo.png")
              ],
            ),
          ),
          Positioned(
              height: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                height: 54,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                          color: Color.fromARGB(251, 105, 111, 216),
                          blurRadius: 20.0,
                          offset: Offset(0, 10))
                    ]),
                child: TextField(
                  decoration: InputDecoration(
                      hintText: "Search",
                      hintStyle: TextStyle(
                        color: Color(0xFF0C9869).withOpacity(0.5),
                      ),
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      suffixIcon: Icon(Icons.search)),
                ),
              ))
        ],
      ),
    );
  }
}
