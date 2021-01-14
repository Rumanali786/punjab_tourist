import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:punjabtourist/screens/Places.dart';
import 'package:punjabtourist/screens/hotels.dart';
import 'package:punjabtourist/screens/location.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  double xOffset = 0;
  double yOffset = 0;
  double scaleFactor = 1;

  bool isDrawerOpen = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      transform: Matrix4.translationValues(xOffset, yOffset, 0)
        ..scale(scaleFactor)
        ..rotateY(isDrawerOpen ? -0.5 : 0),
      duration: Duration(milliseconds: 250),
      decoration: BoxDecoration(image: DecorationImage(
        image: AssetImage("assets/images/2.jpg"),
        fit: BoxFit.cover,
      ),),
      child: SafeArea(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  isDrawerOpen
                      ? IconButton(
                    icon: Icon(Icons.arrow_back_ios, color: Colors.white,),
                    onPressed: () {
                      setState(() {
                        xOffset = 0;
                        yOffset = 0;
                        scaleFactor = 1;
                        isDrawerOpen = false;
                      });
                    },
                  )
                      : IconButton(
                      icon: Icon(Icons.menu, color: Colors.white,),
                      onPressed: () {
                        setState(() {
                          xOffset = 230;
                          yOffset = 150;
                          scaleFactor = 0.6;
                          isDrawerOpen = true;
                        });
                      }),
                ],
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(20)
                ),

                child: Text("  Punjab Tourist  ", style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 28),),
              ),
              SizedBox(height: MediaQuery.of(context).size.height/30,),
              Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {    Navigator.push(
                                context, MaterialPageRoute(builder: (_) => Hotels()));
                            },
                            child: Card(
                              child: Container(
                                decoration:
                                BoxDecoration(
                                    color: Color(0xffffbf02), boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 7,
                                    blurRadius: 10,
                                    offset: Offset(0, 3),
                                  )
                                ]),
                                height: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 2.5,
                                width: MediaQuery
                                    .of(context)
                                    .size
                                    .width / 3.3,
                                child: Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(Icons.hotel_rounded,
                                          color: Colors.white,
                                          size: MediaQuery
                                              .of(context)
                                              .size
                                              .height *
                                              0.08),
                                      Text(
                                        "Hotels",
                                        style: TextStyle(
                                            fontSize:
                                            MediaQuery
                                                .of(context)
                                                .size
                                                .height / 40,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.white),
                                      ),
                                      SizedBox(
                                        height: MediaQuery
                                            .of(context)
                                            .size
                                            .height / 20,
                                      ),
                                      Text(
                                        "You can select desired city & place you want to visit.",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            color: Colors.white,
                                            fontSize:
                                            MediaQuery
                                                .of(context)
                                                .size
                                                .height /
                                                45),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {

                              Navigator.push(context,
                                  MaterialPageRoute(builder: (_) => Location()));

                            },
                            child: Card(
                              child: Container(
                                decoration: BoxDecoration(boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 7,
                                    blurRadius: 10,
                                    offset: Offset(0, 3),
                                  )
                                ]),
                                height: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 2.5,
                                width: MediaQuery
                                    .of(context)
                                    .size
                                    .width / 3.3,
                                child: Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(Icons.my_location,
                                          size: MediaQuery
                                              .of(context)
                                              .size
                                              .height *
                                              0.08),
                                      Text(
                                        "Location",
                                        style: TextStyle(
                                          fontSize:
                                          MediaQuery
                                              .of(context)
                                              .size
                                              .height / 40,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      SizedBox(
                                        height: MediaQuery
                                            .of(context)
                                            .size
                                            .height / 20,
                                      ),
                                      Text(
                                        "Your can search anything here...",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize:
                                            MediaQuery
                                                .of(context)
                                                .size
                                                .height /
                                                45),
                                      ),
                                      SizedBox(
                                        height: MediaQuery
                                            .of(context)
                                            .size
                                            .height / 20,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (_) => Places()));

                              });
                            },
                            child: Card(
                              child: Container(
                                decoration:
                                BoxDecoration(color: Colors.green, boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 7,
                                    blurRadius: 10,
                                    offset: Offset(0, 3),
                                  )
                                ]),
                                height: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 2.5,
                                width: MediaQuery
                                    .of(context)
                                    .size
                                    .width / 3.3,
                                child: Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(Icons.place_outlined,
                                          size: MediaQuery
                                              .of(context)
                                              .size
                                              .height *
                                              0.08),
                                      Text(
                                        "Places",
                                        style: TextStyle(
                                          fontSize:
                                          MediaQuery
                                              .of(context)
                                              .size
                                              .height / 40,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      SizedBox(
                                        height: MediaQuery
                                            .of(context)
                                            .size
                                            .height / 35,
                                      ),
                                      Text(
                                        "General search famous spot according to your location.",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize:
                                            MediaQuery
                                                .of(context)
                                                .size
                                                .height /
                                                45),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  )),
            ],
          ),
        ),
      ),


    );
  }
}
