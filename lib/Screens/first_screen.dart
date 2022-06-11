import 'package:mini_project_ui/Screens/fitnessPage.dart';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:mini_project_ui/Screens/moneyPage.dart';
import 'package:mini_project_ui/Screens/routine.dart';
import 'package:mini_project_ui/Screens/fitnessPage.dart';
import 'package:mini_project_ui/Screens/upgradedr1.dart';

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
        body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Colors.greenAccent,
                  Colors.indigo,
                ],
              )
          ),
          child: ListView(
            physics: BouncingScrollPhysics(),
            children: <Widget>[
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: EdgeInsets.only(left: 40.0),
                child: Container(
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
              ),
              SizedBox(height: 25,),
              // Container(
              //   margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              //   height: 70,
              //   width: 100,
              //   decoration: BoxDecoration(
              //       border: Border.all(
              //         color: Colors.black87,
              //       ),
              //       borderRadius: BorderRadius.all(Radius.circular(10.0))),
              // ),
              Container(
                height: MediaQuery.of(context).size.height*0.25,
                // width: 100,
                margin: EdgeInsets.symmetric(vertical: 0, horizontal: 25),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  image: DecorationImage(
                    image: AssetImage('images/2.png'),
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
              SizedBox(
                height: 15,
              ),
              Container(
                height: 208,
                // width: 100,
                margin: EdgeInsets.symmetric(vertical: 0, horizontal: 25),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  image: DecorationImage(
                    image: AssetImage('images/1.png'),
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
              SizedBox(
                height: 15,
              ),
              Container(
                height: MediaQuery.of(context).size.height*0.25,
                // width: 100,
                margin: EdgeInsets.symmetric(vertical: 0, horizontal: 25),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  image: DecorationImage(
                    image: AssetImage('images/4.png'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MoneyPage(),
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
              SizedBox(
                height: 15,
              ),
              Container(
                height: MediaQuery.of(context).size.height*0.25,
                // width: 100,
                margin: EdgeInsets.symmetric(vertical: 0, horizontal: 25),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  image: DecorationImage(
                    image: AssetImage('images/3.png'),
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
            ],
          ),
        ),
      ),
    );
  }
}


