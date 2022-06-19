import 'package:firebase_auth/firebase_auth.dart';
import 'package:lottie/lottie.dart';
import 'package:mini_project_ui/Screens/Login.dart';
import 'package:mini_project_ui/Screens/fitnessPage.dart';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:mini_project_ui/Screens/moneyPage.dart';
import 'package:mini_project_ui/Screens/routine.dart';
import 'package:mini_project_ui/Screens/fitnessPage.dart';
import 'package:mini_project_ui/Screens/upgradedr1.dart';

import '../Diet_subScreens/breakfast.dart';
import '../Diet_subScreens/dinner.dart';
import '../Diet_subScreens/lunch.dart';
import '../Diet_subScreens/snacks.dart';


final user = FirebaseAuth.instance.currentUser!;
class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}
class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xFF21BFBD) ,
        appBar: AppBar(backgroundColor: Color(0xFF21BFBD),
          elevation: 0,
          toolbarHeight: 30,
          leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ),
        endDrawer:Drawer2(),
        body:  ListView(
          physics: BouncingScrollPhysics(),
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 10.0, left: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    // width: 125.0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 40.0),
              child: Row(
                children: <Widget>[
                  Text('One',
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 55.0)),
                  SizedBox(width: 5.0),
                  Text('Track',
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          color: Colors.white,
                          fontSize: 30.0))
                ],
              ),
            ),
            //SizedBox(height: 20.0),
            Container(
              height: MediaQuery.of(context).size.height+104 ,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(70.0)),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: 10,),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              SizedBox(height: 5),
                              Text(
                                '  Total calories intake:             ',style: TextStyle(
                                fontSize:28,
                                fontWeight: FontWeight.bold,
                              ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                 '  Calories gained:                               ',style: TextStyle(
                                fontSize:23,
                                color: Colors.blueGrey,
                              ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                '   Calories burnt:                                   ',style: TextStyle(
                                fontSize: 23.0,
                                color: Colors.blueGrey,
                              ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      height: 155,
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black87,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(10.0))),
                    ),
                  ),
                  SizedBox(height: 15,),
                  Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Container(
                      height: MediaQuery.of(context).size.height*0.25,
                      // width: 100,
                      margin: EdgeInsets.symmetric(vertical: 0, horizontal: 25),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        image: DecorationImage(
                          image: AssetImage('images/dietpng.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => UpDiet(),
                            ),
                          );
                        }, // Handle your callback.
                        splashColor: Colors.black.withOpacity(0.3),
                        child: Ink(
                          height: 100,
                          width: 100,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Container(
                      height: MediaQuery.of(context).size.height*0.25,
                      // width: 100,
                      margin: EdgeInsets.symmetric(vertical: 0, horizontal: 25),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        image: DecorationImage(
                          image: AssetImage('images/workoutpng.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => FitnessPage(),
                            ),
                          );
                        }, // Handle your callback.
                        splashColor: Colors.black.withOpacity(0.3),
                        child: Ink(
                          height: 100,
                          width: 100,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Container(
                      height: MediaQuery.of(context).size.height*0.25,
                      // width: 100,
                      margin: EdgeInsets.symmetric(vertical: 0, horizontal: 25),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        image: DecorationImage(
                          image: AssetImage('images/routinepng.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => RoutinePage(),
                            ),
                          );
                        }, // Handle your callback.
                        splashColor: Colors.black.withOpacity(0.3),
                        child: Ink(
                          height: 100,
                          width: 100,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            ],
          ),
        ),
    );
  }
}

class Drawer2 extends StatefulWidget {
  const Drawer2({Key? key}) : super(key: key);


  @override
  _Drawer2State createState() => _Drawer2State();
}


class _Drawer2State extends State<Drawer2> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        backgroundColor: Colors.white,
        child: ListView(
          children: [
            Container(
              child: Text(" \n      Settings",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),

            ),
            Lottie.asset('assets/log-out.json'),

            SizedBox(height: 25),
            ListTile(
              title: const Text('   Logout', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
              onTap: () {
               FirebaseAuth.instance.signOut();
               Navigator.push(
                 context,
                 MaterialPageRoute(
                   builder: (context) => Login(),
                 ),
               );
              },
            ),

          ],
        ),
      ),
    );
  }
}