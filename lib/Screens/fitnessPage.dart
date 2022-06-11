import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lottie/lottie.dart';
import 'package:mini_project_ui/Screens/first_screen.dart';
import 'package:mini_project_ui/Screens/moneyPage.dart';
import 'package:mini_project_ui/Screens/routine.dart';
import 'package:mini_project_ui/Screens/upgradedr1.dart';
import 'package:mini_project_ui/Screens/fitness_pages/yoga.dart';
import 'package:mini_project_ui/Screens/fitness_pages/workout.dart';
import 'package:mini_project_ui/Screens/fitness_pages/sports.dart';
import 'package:mini_project_ui/Screens/fitness_pages/cardio.dart';

import 'fitness_pages/yoga.dart';

class FitnessPage extends StatefulWidget {
  const FitnessPage({Key? key}) : super(key: key);

  @override
  State<FitnessPage> createState() => _FitnessPageState();
}

class _FitnessPageState extends State<FitnessPage> {
  int navigationIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFF21BFBD),
        appBar: AppBar(backgroundColor:  Color(0xFF21BFBD),
          elevation: 0,
          toolbarHeight: 60,
          leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            ),
          ),
        ),
        body: Stack(
          children: <Widget>[
            // Container(
            //     height: MediaQuery.of(context).size.height *100,
            //     decoration: BoxDecoration(
            //         gradient: LinearGradient(
            //           begin: Alignment.topRight,
            //           end: Alignment.bottomLeft,
            //           colors: [
            //             Colors.greenAccent,
            //             Colors.indigo,
            //           ],
            //         )
            //     )
            // ),
            // //   Container(
            // //       height: MediaQuery.of(context).size.height - 82.0,
            // //       width: MediaQuery.of(context).size.width,
            // //
            // color: Colors.transparent),
            // SizedBox(
            //   height: 10,
            // ),
            // Padding(
            //   padding: EdgeInsets.only(top: 15.0, left: 10.0),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     children: <Widget>[
            //       IconButton(
            //         icon: Icon(Icons.arrow_back_ios),
            //         color: Colors.white,
            //         onPressed: () {
            //           Navigator.pop(context);
            //         },
            //       ),
            //       Container(
            //           width: 125.0,
            //           child: Row(
            //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //             children: <Widget>[
            //               IconButton(
            //                 icon: Icon(Icons.search),
            //                 color: Colors.white,
            //                 onPressed: () {},
            //               ),
            //               IconButton(
            //                 icon: Icon(Icons.menu),
            //                 color: Colors.white,
            //                 onPressed: () {},
            //               )
            //             ],
            //           ))
            //     ],
            //   ),
            // ),
            // SizedBox(height: 50.0),
            Padding(
              padding: EdgeInsets.only(left: 40.0),
              child: Column(
                children: <Widget>[
                  Text('Fitness',
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 35.0)),
                  Text('key to good health',
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          color: Colors.white,
                          fontSize: 25.0)),
                  // Text('\n\nfood items',
                  //     style: TextStyle(
                  //         fontFamily: 'Montserrat',
                  //         color: Colors.white,
                  //         fontSize: 25.0))
                ],
              ),
            ),
            SizedBox(width: 50.0,),
            Positioned(
                top: 88.0,
                child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(75.0),
                        ),
                        color: Colors.white),
                    height: MediaQuery.of(context).size.height - 185.0,
                    width: MediaQuery.of(context).size.width)),
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 80),),
                      // Lottie.asset('assets/yoga.json'),
                      // SizedBox(
                      //   height: 150,
                      // ),
                      //
                      // SizedBox(
                      //   width: 40.0,
                      //   height: 40.0,
                      // ),
                      Container(
                        child: Expanded(
                          child: GridView.count(
                            crossAxisCount: 2,
                            childAspectRatio: .85,
                            crossAxisSpacing: 20,
                            mainAxisSpacing: 20,
                            children: <Widget>[
                              InkWell(
                                child: Container(
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage('images/yogamain.jpg'),
                                    ),
                                    color: Colors.white,
                                    border: Border(
                                      top: BorderSide(
                                          width: 1.0, color: Colors.black12),
                                      left: BorderSide(
                                          width: 1.0, color: Colors.black12),
                                      right: BorderSide(
                                          width: 1.0, color: Colors.black12),
                                      bottom: BorderSide(
                                          width: 1.0, color: Colors.black12),
                                    ),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                ),
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => YogaPage()));
                                },
                              ),
                              InkWell(
                                child: Container(
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage('images/cardiomain.jpg'),
                                    ),
                                    color: Colors.white,
                                    border: Border(
                                      top: BorderSide(
                                          width: 1.0, color: Colors.black12),
                                      left: BorderSide(
                                          width: 1.0, color: Colors.black12),
                                      right: BorderSide(
                                          width: 1.0, color: Colors.black12),
                                      bottom: BorderSide(
                                          width: 1.0, color: Colors.black12),
                                    ),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                ),
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => CardioPage()));
                                },
                              ),
                              InkWell(
                                child: Container(
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage('images/sportsmain.jpg')),
                                    color: Colors.white,
                                    border: Border(
                                      top: BorderSide(
                                          width: 1.0, color: Colors.black12),
                                      left: BorderSide(
                                          width: 1.0, color: Colors.black12),
                                      right: BorderSide(
                                          width: 1.0, color: Colors.black12),
                                      bottom: BorderSide(
                                          width: 1.0, color: Colors.black12),
                                    ),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                ),
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => SportsPage()));
                                },
                              ),
                              InkWell(
                                child: Container(
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage('images/weightmain.jpg')),
                                    color: Colors.white,
                                    border: Border(
                                      top: BorderSide(
                                          width: 1.0, color: Colors.black12),
                                      left: BorderSide(
                                          width: 1.0, color: Colors.black12),
                                      right: BorderSide(
                                          width: 1.0, color: Colors.black12),
                                      bottom: BorderSide(
                                          width: 1.0, color: Colors.black12),
                                    ),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                ),
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => WorkoutPage()));
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                      // Expanded(child: GridView.count(crossAxisCount: 1,
                      // children: <Widget>[
                      //   Container(
                      //     decoration: BoxDecoration(
                      //
                      //       color: Colors.white,
                      //       border: Border(
                      //         top: BorderSide(width: 1.0, color: Colors.black),
                      //         left: BorderSide(width: 1.0, color: Colors.black),
                      //         right: BorderSide(width: 1.0, color: Colors.black),
                      //         bottom: BorderSide(width: 1.0, color: Colors.black),
                      //       ),
                      //       borderRadius: BorderRadius.only(
                      //         topLeft: const Radius.circular(40.0) ,
                      //         topRight: const Radius.circular(10.0),
                      //         bottomLeft: const Radius.circular(10.0),
                      //         bottomRight: const Radius.circular(40.0),
                      //       ),
                      //     ),
                      //   ),
                      // ],))
                    ]),
              ),
            )
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            iconSize: 28,
            backgroundColor: Color(0xFF21BFBD),
            landscapeLayout: BottomNavigationBarLandscapeLayout.linear,
            selectedItemColor: Colors.white70,
            unselectedItemColor: Colors.black,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                  activeIcon: Icon(
                    Icons.fitness_center_rounded,
                    color: Colors.white70,
                  ),
                  icon: Icon(
                    Icons.fitness_center_rounded,
                    color: Colors.black,
                  ),
                  label: 'Fitness'),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.fastfood_rounded,
                    color: Colors.black,
                  ),
                  label: 'Diet'),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.attach_money_outlined,
                    color: Colors.black,
                  ),
                  label: 'Money'),

              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.timer_rounded,
                    color: Colors.black,
                  ),
                  label: 'Routine'),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home,
                    color: Colors.black,
                  ),
                  label: 'Home'),
              // BottomNavigationBarItem(icon: Icon(),label: Icons.lunch_dining_outlined),
            ],
            onTap: (int index) {
              setState(() {
                navigationIndex = index;
                switch (navigationIndex) {
                  case 0:
                    Fluttertoast.showToast(msg:"U are on the Fitness Page");
                    break;
                  case 1:
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => UpDiet()),
                    );
                    break;
                  case 2:
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MoneyPage()),
                    );
                    break;
                  case 3:
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RoutinePage()),
                    );
                    break;
                  case 4:
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MyApp(),
                      ),
                    );
                }
              });
            }),
      ),
    );
  }
}
