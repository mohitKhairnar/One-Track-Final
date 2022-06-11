import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lottie/lottie.dart';
import 'package:mini_project_ui/Diet_subScreens/dinner.dart';
import '../Diet_subScreens/breakfast.dart';
import '../Diet_subScreens/lunch.dart';
import '../Diet_subScreens/snacks.dart';
import 'fitnessPage.dart';
import 'moneyPage.dart';
import 'routine.dart';
import '../constants/detailspage.dart';

class UpDiet extends StatefulWidget {
  @override
  _UpDietState createState() => _UpDietState();
}
class _UpDietState extends State<UpDiet> {
  int navigationIndex=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      endDrawer:Drawer1(),
      backgroundColor: Color(0xFF21BFBD),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 0.0, left: 10.0),
            child:  SizedBox(height: 10.0),
          ),
          Padding(
            padding: EdgeInsets.only(left: 40.0),
            child: Row(
              children: <Widget>[
                Text('Daily',
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 25.0)),
                SizedBox(width: 5.0),
                Text('food items',
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        color: Colors.white,
                        fontSize: 25.0))
              ],
            ),
          ),
          SizedBox(height: 20.0),
          Container(
            height: MediaQuery.of(context).size.height - 185.0,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(75.0)),
            ),
            child: ListView(
              primary: false,
              padding: EdgeInsets.only(left: 25.0, right: 20.0),
              children: <Widget>[
                Padding(
                    padding: EdgeInsets.only(top: 30.0),
                    child: Column(
                      children: [
    Container(
    height: MediaQuery.of(context).size.height - 250.0,
    child: ListView(children: [
    _buildFoodItem('tea', 'Tea', 40.00,0.00,"AD"),
    _buildFoodItem('eggs', ' Eggs(per pc)', 78.00,0.00,"A"),
    _buildFoodItem('9', 'Hot Coffee', 30.00,0.00,"A,B6"),
    _buildFoodItem('10', 'Fruit plate', 100.00,0.00,"B,A,C"),
    _buildFoodItem('3', 'Dosa', 133.00,0.00,"AD"),
    _buildFoodItem('Fish', 'Salmon bowl Fish', 275.00,0.00,"A,B6"),
    _buildFoodItem('chapati', 'Roti', 70.00,0.00,"AD"),
    _buildFoodItem('4', 'Medu vada(1pc)', 97.00,0.00,"A"),
    _buildFoodItem('Dal', 'Dal', 200.00,0.00,"A"),
    _buildFoodItem('rice', 'Rice', 250.00,0.00,"AD"),
    _buildFoodItem('5', 'Sprouts', 190.00,0.00,"A,B6"),
    _buildFoodItem('6', 'Halwa/Shira', 383.00,0.00,"B,A,C"),
    _buildFoodItem('7', 'Upit', 250.00,0.00,"AD"),
    _buildFoodItem('fries', 'Fries', 00.00,0.00,"AD"),
    _buildFoodItem('Vertical Lockup on Black Background', 'Pohe', 250.00,0.00,"A"),
    _buildFoodItem('burger', 'Burger(per pc)', 300.00,0.00,"A"),
    _buildFoodItem('cake', 'Cake(per pc)', 140.00,0.00,"AD"),
    _buildFoodItem('sandw', 'Sandwich', 250.00,0.00,"A"),
      _buildFoodItem('fenu', 'Fenugreek', 49.00,0.00,"A"),
    _buildFoodItem('ice', 'Kulfi/Ice Cream', 267.00,0.00,"B,A,C"),
      _buildFoodItem('pan2', 'Pani puri(1 serving)', 329.00,0.00,"AD"),
    _buildFoodItem('samosa', 'Samosa', 262.00,0.00,"A"),
    _buildFoodItem('pizza', 'Pizza(per slice)', 270.00,0.00,"AD"),
    _buildFoodItem('Vertical Lockup on White Background', 'Idli', 39.00,0.00,"AD"),
    _buildFoodItem('8', 'Misal pav', 290.00,0.00,"AD"),
    _buildFoodItem('11', 'Biscuits(per pc)', 17.00,0.00,"AD"),
    _buildFoodItem('ladyfig', 'Ladyfinger', 80.00,0.00,"AD"),
    _buildFoodItem('brinjal', 'Eggplant', 140.00,0.00,"AD"),
    _buildFoodItem('pulses', 'Pulses(100 gm)', 81.00,0.00,"AD"),
    _buildFoodItem('pavbhaji', 'Pav-bhaji(1 serving)', 400.00,0.00,"AD"),
    ],
    ),
    ),
    ],
    ),),
    ],
    ),
    )
    ],

      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: 1,
          type: BottomNavigationBarType.fixed,
          iconSize: 28,
          backgroundColor: Color(0xFF21BFBD),
          landscapeLayout: BottomNavigationBarLandscapeLayout.linear,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.black,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.fitness_center_rounded,
                  color: Colors.black,
                ),
                label: 'Fitness'),
            BottomNavigationBarItem(
                activeIcon: Icon(
                  Icons.fastfood_rounded,
                  color: Colors.white70,
                ),
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
          onTap:(int index)
          {
            setState(() {
              navigationIndex=index;
              switch(navigationIndex)
              {
                case 0:
                  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder:(context)=>FitnessPage()), (route) => (route.isFirst));
                  break;
                case 1:
                  Fluttertoast.showToast(msg:"U are on the  Diet");
                  break;
                case 2:
                  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder:(context)=>MoneyPage()), (route) => (route.isFirst));
                  break;
                case 3:
                  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder:(context)=>RoutinePage()), (route) => (route.isFirst));
                  break;
                case 4:
                  Navigator.pop(context);
              }
            }
            );
          }
      ),
    );
  }

  Widget _buildFoodItem(String img, String foodName, double cal, double weight,String vit) {
    return Padding(
        padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
        child: InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => DetailsPage(heroTag: "images/$img.jpg", foodName: foodName, foodCal: cal,weight: weight,vit: vit)
              ));
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                    child: Row(
                        children: [
                          Hero(
                              tag: "images/$img.jpg",
                              child: Image(
                                  image: AssetImage("images/$img.jpg"),
                                  fit: BoxFit.cover,
                                  height: 75.0,
                                  width: 75.0
                              )
                          ),
                          SizedBox(width: 10.0),
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children:[
                                Text(
                                    foodName,
                                    style: TextStyle(
                                        fontFamily: 'Montserrat',
                                        fontSize: 17.0,
                                        fontWeight: FontWeight.bold
                                    )
                                ),
                                Center(
                                  child: Text(
                                      "Min Calorie: $cal",
                                      style: TextStyle(
                                          fontFamily: 'Montserrat',
                                          fontSize: 15.0,
                                          color: Colors.grey
                                      )
                                  ),
                                )
                              ]
                          )
                        ]
                    )
                ),
                IconButton(
                    icon: Icon(Icons.add),
                    color: Colors.black,
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => DetailsPage(heroTag: "images/$img.jpg", foodName: foodName, foodCal: cal,weight: weight,vit: vit)
                      ));
                    }
                )
              ],
            )
        ));
  }
}
class Drawer1 extends StatefulWidget {
  const Drawer1({Key? key}) : super(key: key);

  @override
  State<Drawer1> createState() => _Drawer1State();
}

class _Drawer1State extends State<Drawer1> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        backgroundColor: Colors.white,
        child: ListView(
          children: [
            Container(
              child: Text(" \n Hello User !",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
            ),
            Container(
              child: Text(" What food will u have today? ",style: TextStyle(fontSize: 18),),
            ),
            SizedBox(height: 25),
            Lottie.asset('assets/eat17.json'),
            ListTile(
              title: const Text('Breakfast'),
              onTap: () {
               Navigator.push(context, MaterialPageRoute(builder: (context)=>Breakfast()));
              },
            ),
            ListTile(
              title: const Text('Lunch'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Lunch()));
              },
            ),

            ListTile(
              title: const Text('Snacks'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Snacks()));
              },
            ),

            ListTile(
              title: const Text('Dinner'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Dinner()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
