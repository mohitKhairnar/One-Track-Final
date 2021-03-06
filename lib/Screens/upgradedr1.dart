import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
  var bmi;
  UpDiet({Key? key, this.bmi}) : super(key: key);

  @override
  _UpDietState createState() => _UpDietState();
}

class _UpDietState extends State<UpDiet> {
  int navigationIndex = 0;
  double bmi = 0.0;
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  final FirebaseAuth auth = FirebaseAuth.instance;

  void isBMI() async {
    final User? user = auth.currentUser;
    final uid = user?.uid;
    final querySnapshot = await FirebaseFirestore.instance
        .collection('food').doc(uid).get();
    Map<String, dynamic>? data = querySnapshot.data();
    if(data == null){
      setState(() {
        bmi = 0.00;
      });
    } else {
      setState(() {
        bmi = double.parse(data['bmi']);
      });
    }
  }

  List Items = [
    [1, 'tea', 'Tea', 40.00, 0.00, "AD"],
    [2, 'eggs', ' Egg boiled(1 egg)', 93.00, 0.00, "A"],
    [3, 'coffee', 'Hot Coffee', 30.00, 0.00, "A,B6"],
    [4, 'apple', 'Apple(1 fruit)', 182.00, 0.00, "B,A,C"],
    [5, '3', 'Dosa', 133.00, 0.00, "AD"],
    [6, 'Fish', 'Salmon bowl Fish', 275.00, 0.00, "A,B6"],
    [7, 'Almonds', 'Almonds (Roasted)', 70.00, 0.00, "AD"],
    [8, '4', 'Medu vada(1pc)', 97.00, 0.00, "A"],
    [9, 'banana', 'Banana (1 whole)', 134.00, 0.00, "A"],
    [10, 'rice', 'Rice', 250.00, 0.00, "AD"],
    [11, '5', 'Sprouts', 190.00, 0.00, "A,B6"],
    [12, 'cashew', 'Cashewnuts', 383.00, 0.00, "B,A,C"],
    [13, '7', 'Upit', 250.00, 0.00, "AD"],
    [14, 'kiwi', 'Kiwi', 00.00, 0.00, "AD"],
    [15, 'milk', 'Milk(per 100 ml)', 44.00, 0.00, "A"],
    [16, 'oats', 'Oats(1 cup)', 88.00, 0.00, "A"],
    [17, 'omlette', 'Omlette', 140.00, 0.00, "AD"],
    [18, 'sandw', 'Sandwich', 250.00, 0.00, "A"],
    [19, 'fenu', 'Fenugreek', 49.00, 0.00, "A"],
    [20, 'papaya', 'Papaya', 267.00, 0.00, "B,A,C"],
    [21, 'pears', 'Pears', 329.00, 0.00, "AD"],
    [22, 'samosa', 'Samosa', 262.00, 0.00, "A"],
    [23, 'butter', 'Butter(1 tbsp.)', 102.00, 0.00, "AD"],
    [24, 'Vertical Lockup on White Background', 'Idli(per pc)', 39.00, 0.00, "AD"],
    [25, 'jam', 'Strawberries', 4.00, 0.00, "AD"],
    [26, 'bread', 'Brown Bread(per pc)', 73.00, 0.00, "AD"],
    [27, 'ladyfig', 'Ladyfinger', 80.00, 0.00, "AD"],
    [28, 'brinjal', 'Eggplant', 140.00, 0.00, "AD"],
    [29, 'pulses', 'Pulses(100 gm)', 81.00, 0.00, "AD"],
    [30, 'cereals', 'Cereals', 400.00, 0.00, "AD"],
    [31,'pohe', 'Pohe(per serving)', 250.00, 0.00, "AD"],
    [32,'brocly', 'Brocly', 250.00, 0.00, "AD"]
  ];
  List<int> normal = [0,1, 2, 3, 4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31];
  List<int> overW = [2,8,9, 10, 11, 12,15,19,20,23,24,27,28,29];
  List<int> underW = [0,4,9, 16, 14, 20,22,24,26,28,29,30];
  List<Widget> test(List<int> tmp) {
    List<Widget> foodItem = [];
    tmp.forEach((element) {
      foodItem.add(_buildFoodItem(
          Items[element][0],
          Items[element][1],
          Items[element][2],
          Items[element][3],
          Items[element][4],
          Items[element][5],

      ));
    });
    // Items.forEach((element) {
    //
    // }
    // );
    // foodItem.add(_buildFoodItem(1, 'tea', 'Tea', 40.00, 0.00, "AD"));
    return foodItem;
  }
@override
void initState() {
    // TODO: implement initState
    super.initState();
    isBMI();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF21BFBD),
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
      endDrawer: Drawer1(),
      backgroundColor: Color(0xFF21BFBD),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 0.0, left: 10.0),
            child: SizedBox(height: 10.0),
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
                        child: ListView(
                          children: test(bmi == 0.0?normal:(bmi >= 25
                              ? overW
                              : bmi > 18.5
                                  ? normal
                                  : overW)),
                        ),
                      ),
                    ],
                  ),
                ),
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
          onTap: (int index) {
            setState(() {
              navigationIndex = index;
              switch (navigationIndex) {
                case 0:
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => FitnessPage()),
                      (route) => (route.isFirst));
                  break;
                case 1:
                  Fluttertoast.showToast(msg: "U are on the  Diet");
                  break;
                case 2:
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => MoneyPage()),
                      (route) => (route.isFirst));
                  break;
                case 3:
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => RoutinePage()),
                      (route) => (route.isFirst));
                  break;
                case 4:
                  Navigator.pop(context);
              }
            });
          }),
    );
  }

  Widget _buildFoodItem(int num, String img, String foodName, double cal,
      double weight, String vit) {
    return Padding(
        padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
        child: InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => DetailsPage(
                      heroTag: "images/$img.jpg",
                      foodName: foodName,
                      foodCal: cal,
                      weight: weight,
                      vit: vit)));
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                    child: Row(children: [
                  Hero(
                      tag: "images/$img.jpg",
                      child: Image(
                          image: AssetImage("images/$img.jpg"),
                          fit: BoxFit.cover,
                          height: 75.0,
                          width: 75.0)),
                  SizedBox(width: 10.0),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(foodName,
                            style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 17.0,
                                fontWeight: FontWeight.bold)),
                        Center(
                          child: Text("Min Calorie: $cal",
                              style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontSize: 15.0,
                                  color: Colors.grey)),
                        )
                      ])
                ])),
                IconButton(
                    icon: Icon(Icons.add),
                    color: Colors.black,
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => DetailsPage(
                              heroTag: "images/$img.jpg",
                              foodName: foodName,
                              foodCal: cal,
                              weight: weight,
                              vit: vit)));
                    })
              ],
            )));
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
              child: Text(
                " \n Hello User !",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              child: Text(
                " What food will u have today? ",
                style: TextStyle(fontSize: 18),
              ),
            ),
            SizedBox(height: 25),
            Lottie.asset('assets/eat17.json'),
            ListTile(
              title: const Text('Breakfast'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Breakfast()));
              },
            ),
            ListTile(
              title: const Text('Lunch'),
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Lunch()));
              },
            ),
            ListTile(
              title: const Text('Snacks'),
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Snacks()));
              },
            ),
            ListTile(
              title: const Text('Dinner'),
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Dinner()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
