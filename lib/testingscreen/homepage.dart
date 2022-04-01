import 'package:flutter/material.dart';
import 'package:lost_n_found/testingscreen/CustomShapeClipper.dart';
import 'package:lost_n_found/fPage/homedashpage.dart';
import 'package:lost_n_found/testingscreen/search.dart';
import 'package:lost_n_found/constants.dart';

Color firstColor = Colors.blueAccent;//Color(0xFFF47D15);
Color secondColor = Colors.cyan;//Color(0xFFEF772C);
const TextStyle dropDownLabelStyle = TextStyle(color: Colors.white,fontSize: 16.0);
const TextStyle dropDownMenuStyle = TextStyle(color: Colors.black,fontSize: 16.0);

 bool isSeen = true;

ThemeData appTheme = ThemeData(
  primaryColor: Colors.blue
);

List<String> locations = ['Athi River (ATR)','Valley Road (VRD)'];

 class HomeScreen extends StatefulWidget {
   const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

   @override
   Widget build(BuildContext context) {
     return Scaffold(
       body: SingleChildScrollView(
         child: Column(
           children: <Widget>[
            const HomeScreenTopPart(),
               homeScreenFound(),
           ],
         ),
       ),
     );
   }
}


class HomeScreenTopPart extends StatefulWidget {
   const HomeScreenTopPart({Key? key}) : super(key: key);
 
   @override
   State<HomeScreenTopPart> createState() => _HomeScreenTopPartState();
 }
 
 class _HomeScreenTopPartState extends State<HomeScreenTopPart> {
   TextEditingController search = TextEditingController();
   var selectedLocationIndex = 0;
    //var isFoundSelected = false;
    var logginuser;
   final Prefs _prefs = Prefs();

   @override
   Widget build(BuildContext context) {
     _prefs.getStringValuesSF('fname').then((firstname) => {
       setState(() {
         logginuser = firstname;
       })
     });
     return Stack(
       children: <Widget>[
         ClipPath(clipper: CustomShapeClipper(),
             child: Container(
                 height: 400.0,
                 //color: Colors.blue,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors:[
                       firstColor,
                       secondColor,
             ],),),
             child: Column(
               children: <Widget>[
                 const SizedBox(height: 50.0),
                 Padding(
                   padding: const EdgeInsets.all(16.0),
                    child: Row(
                      children: <Widget>[
                        const Icon(Icons.location_on,color: Colors.white,),
                        const SizedBox(width: 16.0),
                        PopupMenuButton(
                          onSelected: (index) {
                            setState(() =>  index = selectedLocationIndex
                            );
                            //selectedLocationIndex = index;
                          },
                          child: Row(
                            children: <Widget>[
                              Text(locations[selectedLocationIndex], style: dropDownLabelStyle),
                              const Icon(Icons.keyboard_arrow_down,color: Colors.white,)


                            ],
                          ),
                          itemBuilder: (BuildContext context)=> <PopupMenuItem>[
                            PopupMenuItem(child: Text(locations[0],style: dropDownMenuStyle,),
                            value: 0
                            ),
                            PopupMenuItem(child: Text(locations[1],style: dropDownMenuStyle,),
                                value: 1
                            ),
                          ],
                        ),
                      ],
                    ),
                 ),
                 const SizedBox(height: 50.0),
                 Text("Hi $logginuser\nWelcome!",
                   style: const TextStyle(fontSize: 24.0,color: Colors.white),
                   textAlign: TextAlign.center,),
                 const SizedBox(height: 50.0),
                 Padding(
                   padding: const EdgeInsets.symmetric(horizontal: 32.0),
                    child: Material(
                      elevation: 5.0,
                      borderRadius: const BorderRadius.all(Radius.circular(30.0),),
                      child: TextField(
                        controller: search,
                        cursorColor: appTheme.primaryColor,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 15.0),
                          suffixIcon: Material(
                            elevation: 2.0,
                            borderRadius: const BorderRadius.all(Radius.circular(30.0)),
                            child: InkWell(
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>const SearchListings()));
                                },
                                child: const Icon(Icons.search,color: Colors.black)),
                          ),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                 ),
                 const SizedBox(height: 15.0),
                 Row(
                   mainAxisSize: MainAxisSize.min,
                   mainAxisAlignment: MainAxisAlignment.spaceAround,
                   children: <Widget>[
                     InkWell(
                         child: ChoiceChip(
                           icon:Icons.add_reaction,text:"Found Items",isSelected: isSeen),
                       onTap: () {
                           setState(() => isSeen = true);
                       },
                     ),
                     const SizedBox(width: 20.0),
                     InkWell(
                         child: ChoiceChip(
                             icon: Icons.add_moderator_sharp,text: 'Lost Items',isSelected: !isSeen),
                        onTap: () {
                           setState(() => isSeen = false);
                        },
                     ),
                   ],
                 )
               ],
             ),
             ),
         ),

       ],
     );
   }
 }
 //  final bool isShow;
//  void showFoundItems () {
//   CardWidget();
//  }
// void showLostItems () {
//   FoundCardWidget();
// }
 class ChoiceChip extends StatefulWidget {
   const ChoiceChip({Key? key, required this.text, required this.icon,required this.isSelected}) : super(key: key);

   final IconData icon;
   final String text;
   final bool isSelected;

   @override
   State<ChoiceChip> createState() => _ChoiceChipState();
 }

 class _ChoiceChipState extends State<ChoiceChip> {
   @override
   Widget build(BuildContext context) {
     return Container(
       padding:const EdgeInsets.symmetric(horizontal: 5.0,vertical: 8.0),
       decoration:widget.isSelected ? BoxDecoration(
         color: Colors.white.withOpacity(0.15),
         borderRadius:const BorderRadius.all(
           Radius.circular(20.0),
         ),
       ): null,
       child: Row(
         mainAxisSize: MainAxisSize.min,
         mainAxisAlignment: MainAxisAlignment.spaceBetween,
         children: <Widget>[
         Icon(
             widget.icon,
              size: 20.0,
           color: Colors.white,
         ),
           const SizedBox(
           width: 4.0,
         ),
         Text(
           widget.text,
           style:const TextStyle(
               color: Colors.white,
                fontSize: 16.0,
           ),)
       ],),
     );
   }
 }


 var viewAllStyle= TextStyle(fontSize: 14.0,color: appTheme.primaryColor);
 homeScreenFound () {
   return Column(
     children: <Widget>[
       Padding(
         padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
         child: Row(
           mainAxisSize: MainAxisSize.max,
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
           children: <Widget>[
             const Text("Currently Watched Items", style: dropDownMenuStyle,),
             const Spacer(),
             Text("VIEW ALL(12)", style: viewAllStyle,),
           ],
         ),
       ),
       //const FoundCardWidget(),
       if(isSeen!=true) FoundCardWidget() else CardWidget(),
       //const CardWidget(),
     ],
   );
 }
homeScreenLost () {
 return Column(
  children: <Widget>[
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
      child: Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        const Text("Currently Watched Items", style: dropDownMenuStyle, ),
        const Spacer(),
        Text("VIEW ALL(12)", style: viewAllStyle, ),
   ],
  ),
),
     const FoundCardWidget(),
    //const CardWidget(),
      ],
     );
  }


 
 