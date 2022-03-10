import 'package:flutter/material.dart';

import 'header_with_searchbox.dart';

class HomeDash extends StatelessWidget {
  const HomeDash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          // HeaderWithSearchBox(size: size),
          More_key(
            title: "Lost Items",
          ),
          CardWidget(),
          More_key(
            title: "Found Items",
          ),
          FoundCardWidget(),
        ],
      ),
    );
  }
}

class CardWidget extends StatelessWidget {
  const CardWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(children: <Widget>[
        ItemsCard(
          image: 'assets/images.jpg',
          location: 'Imani Hostel',
          title: 'Sony Headphones',
        ),
        /*  ItemsCard(
          image: 'assets/glasse1s1.jpg',
          location: 'Patience Hostel',
          title: 'Glasses',
        ), */
        ItemsCard(
          image: 'assets/airpods.jpg',
          location: 'PowerLab',
          title: 'White Airpods',
        ),
        ItemsCard(
          image: 'assets/airpods.jpg',
          location: 'PowerLab',
          title: 'White Airpods',
        )
      ]),
    );
  }
}

class More_key extends StatelessWidget {
  const More_key({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        children: <Widget>[
          TitleWithCustomUnderLine(
            title: "$title",
          ),
          Spacer(),
          TextButton(onPressed: () {}, child: Text("More"))
        ],
      ),
    );
  }
}

class ItemsCard extends StatelessWidget {
  const ItemsCard({
    Key? key,
    required this.location,
    required this.image,
    required this.title,
  }) : super(key: key);

  final String image, title, location;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        margin: EdgeInsets.only(left: 20.0, top: 10.0, bottom: 50.0),
        width: size.width * 0.4,
        child: Column(
          children: <Widget>[
            Image.asset(image),
            GestureDetector(
              child: Container(
                padding: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10)),
                    boxShadow: [
                      BoxShadow(
                          color: Color.fromARGB(251, 105, 111, 216),
                          blurRadius: 20.0,
                          offset: Offset(0, 10))
                    ]),
                child: Row(
                  children: <Widget>[
                    RichText(
                        text: TextSpan(children: [
                      TextSpan(
                          text: "$title \n",
                          style: Theme.of(context).textTheme.button),
                      TextSpan(
                          text: "$location",
                          style: TextStyle(color: Colors.blue.withOpacity(0.5)))
                    ]))
                  ],
                ),
              ),
            )
          ],
        ));
  }
}

//Found Items Widget
class FoundItemsCard extends StatelessWidget {
  const FoundItemsCard({
    Key? key,
    required this.location,
    required this.image,
    required this.title,
  }) : super(key: key);

  final String image, title, location;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        margin: EdgeInsets.only(left: 20.0, top: 10.0, bottom: 50.0),
        width: size.width * 0.4,
        child: Column(
          children: <Widget>[
            Image.asset(image),
            GestureDetector(
              child: Container(
                padding: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10)),
                    boxShadow: [
                      BoxShadow(
                          color: Color.fromARGB(251, 105, 111, 216),
                          blurRadius: 20.0,
                          offset: Offset(0, 10))
                    ]),
                child: Row(
                  children: <Widget>[
                    RichText(
                        text: TextSpan(children: [
                      TextSpan(
                          text: "$title \n",
                          style: Theme.of(context).textTheme.button),
                      TextSpan(
                          text: "$location",
                          style: TextStyle(color: Colors.blue.withOpacity(0.5)))
                    ]))
                  ],
                ),
              ),
            )
          ],
        ));
  }
}

class FoundCardWidget extends StatelessWidget {
  const FoundCardWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(children: <Widget>[
        ItemsCard(
          image: 'assets/ring.jpg',
          location: 'Cafeteria',
          title: 'Diamond Ring',
        ),
        ItemsCard(
          image: 'assets/dizo.jpg',
          location: 'PAC',
          title: 'Dizo Earphones',
        ),
        ItemsCard(
          image: 'assets/ring.jpg',
          location: 'Cafeteria',
          title: 'Diamond Ring',
        )
      ]),
    );
  }
}

class TitleWithCustomUnderLine extends StatelessWidget {
  const TitleWithCustomUnderLine({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 24,
      child: Stack(children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 5.0),
          child: Text(
            title,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
                margin: EdgeInsets.only(right: 5.0),
                height: 7,
                color: Color.fromRGBO(143, 148, 251, 1).withOpacity(0.2)))
      ]),
    );
  }
}
