import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:lost_n_found/testingscreen/CustomShapeClipper.dart';
import 'package:lost_n_found/testingscreen/homepage.dart';
class SearchListings extends StatelessWidget {
  const SearchListings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Search Result"),
        elevation: 0.0,
        centerTitle: true,
        leading: InkWell(
          child: Icon(Icons.arrow_back_ios_new),
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: <Widget>[
            SearchListingTopPart(),
            SizedBox(height: 20.0),
            SearchListingBottomPart(),
          ],
        ),
      ),
    );
  }
}

class SearchListingTopPart extends StatelessWidget {
  const SearchListingTopPart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        ClipPath(
          clipper: CustomShapeClipper(),
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors:[
                  firstColor,
                  secondColor,
                ],),
            ),
            height: 160.0,
          ),
        ),
        Column(
          children: <Widget>[
            SizedBox(height: 20.0),
            Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10.0))),
              margin: EdgeInsets.symmetric(horizontal: 16.0),
              elevation: 10.0,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16.0,vertical: 22.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Expanded(
                      flex: 5,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text("Athi River (ATR)",style: TextStyle(fontSize: 16.0),),
                          Divider(color: Colors.grey),
                          Text("Valley Road (VRD)",style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.w600),),
                        ],
                      ),
                    ),
                    Spacer(),
                    Expanded(
                      flex: 1,
                        child: Icon(
                            Icons.import_export,
                            color: Colors.black,
                            size: 32.0,
                        ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}

class SearchListingBottomPart extends StatelessWidget {
  const SearchListingBottomPart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                "Search Result",
                style: dropDownMenuStyle,
              ),
            ),
            SizedBox(height: 10.0),
                ListView(
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  children: <Widget>[
                    SearchItemsCard(itemlabel: 'White Earphones',dayposted: 'Feb 19,2022',lokeshen: 'Dining Hall'),
                    SearchItemsCard(itemlabel: 'Keys',dayposted: 'Jan 22,2022',lokeshen: 'PAC'),
                    SearchItemsCard(itemlabel: 'Hoodie',dayposted: 'Mar 7,2022',lokeshen: 'Patience'),
                    SearchItemsCard(itemlabel: 'Keys',dayposted: 'Jan 22,2022',lokeshen: 'PAC'),
                    SearchItemsCard(itemlabel: 'Keys',dayposted: 'Jan 22,2022',lokeshen: 'PAC'),
                    SearchItemsCard(itemlabel: 'Keys',dayposted: 'Jan 22,2022',lokeshen: 'PAC'),
                    SearchItemsCard(itemlabel: 'Keys',dayposted: 'Jan 22,2022',lokeshen: 'PAC'),
                  ],
                ),
          ],
        ),
    );
  }
}
class SearchItemsCard extends StatelessWidget {
  const SearchItemsCard({Key? key, required this.itemlabel,required this.dayposted,required this.lokeshen}) : super(key: key);
  final String itemlabel,dayposted,lokeshen;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Stack(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(right: 16.0),
            //height: 100.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10.0),),
              border: Border.all(color: Colors.blueAccent)
              // boxShadow: [
              //   BoxShadow(
              //       color: Color.fromARGB(251, 105, 111, 216),
              //       blurRadius: 20.0,
              //       offset: Offset(0, 10))
              // ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Text(itemlabel,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20.0),),

                    ],
                  ),
                  Wrap(
                    spacing: 8.0,
                    runSpacing: -8.0,
                    children: <Widget>[
                      SearchItemCardDetails(iconData: Icons.calendar_today, label: dayposted),
                      SearchItemCardDetails(iconData: Icons.location_on, label: lokeshen)
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SearchItemCardDetails extends StatelessWidget {
  const SearchItemCardDetails({Key? key, required this.iconData, required this.label}) : super(key: key);

  final IconData iconData;
  final String label;
  @override
  Widget build(BuildContext context) {
    return RawChip(
      label: Text(label),
      labelStyle: TextStyle(color:Colors.black,fontSize: 14.0),
      backgroundColor: Color.fromRGBO(0, 212, 255, 100),
      avatar: Icon(iconData,size: 14.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10.0),)
      ),
    );
  }
}




