import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mini_project_ui/constants/detailspage.dart';

import '../Screens/fitnessPage.dart';
import '../Screens/moneyPage.dart';
import '../Screens/routine.dart';

class Snacks extends StatefulWidget {
  const Snacks({Key? key}) : super(key: key);

  @override
  State<Snacks> createState() => _SnacksState();
}

class _SnacksState extends State<Snacks> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
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
      backgroundColor: Color(0xFF21BFBD),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 0.0, left: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  width: 125.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  ),),
              ],
            ),
          ),
          SizedBox(height: 10.0),
          Padding(
            padding: EdgeInsets.only(left: 40.0),
            child: Row(
              children: <Widget>[
                Text('Snacks',
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
                          _buildFoodItem('tea123', 'Tea', 40.00,0.00,"AD",context),
                          _buildFoodItem('cof1', 'Hot Coffee', 30.00,0.00,"A,B6",context),
                          _buildFoodItem('fruits1', 'Fruit plate', 100.00,0.00,"B,A,C",context),
                          _buildFoodItem('dosa1', 'Dosa', 133.00,0.00,"AD",context),
                          _buildFoodItem('medu1', 'Medu vada(1pc)', 97.00,0.00,"A",context),
                          _buildFoodItem('kd1', 'Sprouts', 190.00,0.00,"A,B6",context),
                          _buildFoodItem('shira2', 'Halwa/Shira', 383.00,0.00,"B,A,C",context),
                          _buildFoodItem('upma1', 'Upit', 250.00,0.00,"AD",context),
                          _buildFoodItem('fries1', 'Fries(71gm)', 312.00,0.00,"AD",context),
                          _buildFoodItem('pohe1', 'Pohe', 250.00,0.00,"A",context),
                          _buildFoodItem('burg1', 'Burger(per pc)', 300.00,0.00,"A",context),
                          _buildFoodItem('cake12', 'Cake(per pc)', 140.00,0.00,"AD",context),
                          _buildFoodItem('sandw12', 'Sandwich', 250.00,0.00,"A",context),
                          _buildFoodItem('ice', 'Kulfi/Ice Cream', 267.00,0.00,"B,A,C",context),
                          _buildFoodItem('pan2', 'Pani puri(1 serving)', 329.00,0.00,"AD",context),
                          _buildFoodItem('samos1', 'Samosa', 262.00,0.00,"A",context),
                          _buildFoodItem('egg1', ' Eggs(per pc)', 78.00,0.00,"A",context),
                          _buildFoodItem('pizz', 'Pizza', 270.00,0.00,"AD",context),
                          _buildFoodItem('idli1', 'Idli', 39.00,0.00,"AD",context),
                          _buildFoodItem('8', 'Misal pav', 290.00,0.00,"AD",context),
                          _buildFoodItem('biscuit1', 'Biscuits(per pc)', 17.00,0.00,"AD",context),
                          _buildFoodItem('pavbh1', 'Pav-bhaji', 400.00,0.00,"AD",context),
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
          ],
          onTap:(int index)
          {
            setState(() {
              var navigationIndex=index;
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
}


Widget _buildFoodItem(String img, String foodName, double cal, double weight,String vit,BuildContext context) {
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



