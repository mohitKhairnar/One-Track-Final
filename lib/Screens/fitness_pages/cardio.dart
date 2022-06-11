import 'package:path/path.dart';
import 'yoga_details.dart';
import 'package:flutter/material.dart';
import 'package:mini_project_ui/Screens/fitness_pages/cardio_details.dart';
import 'package:mini_project_ui/Screens/moneyPage.dart';
import 'package:mini_project_ui/Screens/routine.dart';
import '../fitnessPage.dart';

class CardioPage extends StatefulWidget {
  const CardioPage({Key? key}) : super(key: key);

  @override
  _CardioPageState createState() => _CardioPageState();
}

class _CardioPageState extends State<CardioPage> {
  int navigationIndex=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF21BFBD),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 15.0, left: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.arrow_back_ios),
                  color: Colors.white,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                Container(
                    width: 125.0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        IconButton(
                          icon: Icon(Icons.search),
                          color: Colors.white,
                          onPressed: () {},
                        ),
                        IconButton(
                          icon: Icon(Icons.menu),
                          color: Colors.white,
                          onPressed: PopUp,
                        )
                      ],
                    ))
              ],
            ),
          ),
          SizedBox(height: 10.0),
          Padding(
            padding: EdgeInsets.only(left: 40.0),
            child: Row(
              children: <Widget>[
                Text('Cardio',
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 35.0)),
                // SizedBox(width: 5.0),
                // Text('food items',
                //     style: TextStyle(
                //         fontFamily: 'Montserrat',
                //         color: Colors.white,
                //         fontSize: 25.0))
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
            child:  ListView(
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
                          _buildCardio(context,'jogging2', 'Jogging','Breath','hhh'),
                          _buildCardio(context,'high_knees', 'High Knees','Breath','hhh'),
                          _buildCardio(context,'jump_rope', 'Jumping Slams','Breath','hhh'),
                          _buildCardio(context,'pull_up', 'Pull Ups','Breath','hhh'),
                          _buildCardio(context,'work_cycle', 'Exercise Cycle','Breath','hhh'),
                          _buildCardio(context,'cycling2', 'Cycling','Breath','hhh'),
                          _buildCardio(context,'crunches2', 'Crunches','Breath','hhh'),
                          _buildCardio(context,'ball_situps', 'Weight Situps','Breath','hhh'),
                          // _buildPositions(context,'Dal', 'Dal'),
                          // _buildPositions(context,'rice', 'Rice'),
                          // _buildPositions(context,'5', 'Sprouts'),
                          // _buildPositions(context,'6', 'Halwa/Shira'),
                          // _buildPositions(context,'7', 'Upit'),
                          // _buildPositions(context,'fries', 'Fries'),
                          // _buildPositions(context,'Vertical Lockup on Black Background', 'Pohe'),
                          // _buildPositions(context,'burger', 'Burger(per pc)'),
                          // _buildPositions(context,'cake', 'Cake(per pc)'),
                          // _buildPositions(context,'sandw', 'Sandwich'),
                          // _buildPositions(context,'methhi', 'Fenugreek'),
                          // _buildPositions(context,'ice', 'Kulfi/Ice Cream'),
                          // _buildPositions(context,'panip', 'Pani puri'),
                          // _buildPositions(context,'samosa', 'Samosa'),
                          // _buildPositions(context,'pizza', 'Pizza'),
                          // _buildPositions(context,'Vertical Lockup on White Background', 'Idli'),
                          // _buildPositions(context,'8', 'Misal pav'),
                          // _buildPositions(context,'11', 'Biscuits(per pc)'),
                          // _buildPositions(context,'ladyfig', 'Ladyfinger'),
                          // _buildPositions(context,'brinjal', 'Eggplant'),
                          // _buildPositions(context,'pulses', 'Pulses'),
                          // _buildPositions(context,'pavbhaji', 'Pav-bhaji'),
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
          currentIndex: 0,
          type: BottomNavigationBarType.fixed,
          iconSize: 28,
          backgroundColor: Color(0xFF21BFBD),
          landscapeLayout: BottomNavigationBarLandscapeLayout.linear,
          selectedItemColor: Colors.white,
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
                // Fluttertoast.showToast(msg:"U are on the  Diet");
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

class CardioList extends StatefulWidget {
  final String title;
  final String subtitle;
  final String img;
  Function navigate;
  CardioList(@required this.img, @required this.subtitle, @required this.title,
      @required this.navigate);

  @override
  _CardioListState createState() => _CardioListState(img);
}

class _CardioListState extends State<CardioList> {
  int _itemCount = 0;
  Color color = Color.fromRGBO(108, 115, 255, 1);
  Color gradient = Color.fromRGBO(58, 63, 255, 1);

  final String img;

  _CardioListState(this.img);
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.fromLTRB(8, 16, 8, 16),
        child: GestureDetector(
          child: Stack(
            alignment: Alignment.bottomRight,
            children: [
              Card(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(5.0),
                    ),
                    gradient: LinearGradient(
                      colors: [color, gradient],
                      begin: Alignment.topCenter,
                      end: Alignment.topRight,
                    ),
                  ),
                  child: ListTile(
                    textColor: Colors.white,
                    leading: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(300),
                        border: Border.all(width: 2, color: Colors.white),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(200),
                        child: Image(
                          image: AssetImage("images/$img.jpg"),
                          width: 53,
                          height: 55,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    title: Padding(
                      padding: EdgeInsets.only(top: 8.0),
                      child: Text(widget.title),
                    ),
                    subtitle: Text(
                      widget.subtitle,
                      style: TextStyle(fontSize: 12),
                    ),
                    onTap: () {
                      return widget.navigate();
                    },
                    trailing: Icon(Icons.arrow_forward),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
Widget _buildCardio(BuildContext context, String img, String cardioName,String CardioSubtitle, String info) {

  return Padding(
      padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
      child: InkWell(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => CardioDetailsPage(heroTag: "images/$img.jpg", cardioName: cardioName,cardioinfo: info,)
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
                                  cardioName,
                                  style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontSize: 17.0,
                                      fontWeight: FontWeight.bold
                                  )
                              ),
                              Center(
                                child: Text("$CardioSubtitle",
                                    style: TextStyle(
                                        fontFamily: 'Montserrat',
                                        fontSize: 15.0,
                                        color: Colors.grey)),
                              )
                            ]
                        )
                      ]
                  )
              ),
              IconButton(
                  icon: Icon(Icons.arrow_forward_ios),
                  color: Colors.black,
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => CardioDetailsPage(heroTag: "images/$img.jpg", cardioName: cardioName,cardioinfo: info)
                    ));
                  }
              )
            ],
          )
      ));
}




PopupMenuButton PopUp()
{
  print("sanket");
  return PopupMenuButton(itemBuilder: (BuildContext context)=>[
    PopupMenuItem(
        value: 1,
        child: Text('Snacks')),
    PopupMenuItem(
        value: 2,
        child: Text('Breakfast')),
    PopupMenuItem(
        value: 3,
        child: Text('Lunch')),
    PopupMenuItem(
        value: 4,
        child: Text('Dinner')),
  ],
  );
}
