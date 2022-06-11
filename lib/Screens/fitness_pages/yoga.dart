import 'package:path/path.dart';
import 'yoga_details.dart';
import 'package:flutter/material.dart';
import 'package:mini_project_ui/Screens/fitness_pages/yoga_details.dart';
import 'package:mini_project_ui/Screens/moneyPage.dart';
import 'package:mini_project_ui/Screens/routine.dart';
import '../fitnessPage.dart';

class YogaPage extends StatefulWidget {
  const YogaPage({Key? key}) : super(key: key);

  @override
  _YogaPageState createState() => _YogaPageState();
}

class _YogaPageState extends State<YogaPage> {
  int navigationIndex=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor:  Color(0xFF21BFBD),
        elevation: 0,
        toolbarHeight: 40,
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
            padding: EdgeInsets.only(top: 15.0, left: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[

              ],
            ),
          ),
          SizedBox(height: 10.0),
          Padding(
            padding: EdgeInsets.only(left: 40.0,bottom: 20.0),
            child: Row(
              children: <Widget>[
                Text('Asanas',
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
          // SizedBox(height: 20.0),
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
                          _buildPositions(context,'bhujangasana', 'Bhujangasana','For digestion','\n1.Lie flat on your belly with the top of your feet facing downwards.\n'
                              '\n2.Bend your elbows and spread your palms beside the lowest rib.\n'
                              '\n3.As you inhale, press your palms firmly on the mat and slowly lift your torso, hips, and knees off the mat.\n'
                              '\n4.You may look straight ahead or tilt your head slightly backward.\n'
                              '\n5.Stay in this pose for a couple of breaths.\n'),
                          _buildPositions(context,'shirshasana', 'Shirshasana','For fitness','1.The head and the hands are on the floor and form a triangle. Place the crown of the head between the interlocked fingers.\n'
                              '\n2.Slowly, balance the head on the fingers.\n'
                              '\n3.Lift the knees and glutes off the floor and straighten them.\n'
                              '\n4.Bend the knees, keeping the heels near the buttocks, and slowly straighten the hips so that the thighs are perpendicular to the floor.\n'),
                          _buildPositions(context,'padmasana', 'Padmasana','For digestion','1.Sit  with the legs stretched out in front of you while keeping the spine erect.\n'
                              '\n2.Bend the right knee and place it on the left thigh.  and repeat the same step with the other leg.\n'
                              '\n3.With both the legs crossed and feet placed on opposite thighs, place your hands on the knees in the mudra position.\n'
                              '\n4.Keep the head straight and spine erect, and continue with long gentle breaths in and out.\n'),
                          _buildPositions(context,'navasana', 'Navasana','For digestion','1.Sit with your knees bent, feet on the floor.\n'
                              '\n2.Place your hands behind your knees, lift the chest, engaging the back muscles as you inhale.\n'
                              '\n3.Engage your inner thighs and draw your lower belly in and up\n'
                              '\n4.Tip back on the back of your sitting bones and lift your feet up to about knee height, toes spread out\n'
                              '\n5.Bring your arms parallel to the floor\n'
                          ),
                          _buildPositions(context,'vrikshsana', 'Vrikshasana','For digestion','1.Bend your right knee and place the right foot high up on your left thigh.\n'
                              '\n2.Once you are well balanced, take a deep breath in, gracefully raise your arms over your head from the side, and bring your palms together in ‘Namaste’ mudra (hands-folded position).\n'
                              '\n3.Look straight ahead in front of you, at a distant object.\n'),
                          _buildPositions(context,'balasana', 'Balasana','For digestion','1.Kneel down on the floor & sit on your buttocks.\n'
                              '\n2.Keep your big toes touching each other.\n'
                              '\n3.Place your knees hip-width apart and inhale.\n'
                              '\n4.Now bend forward and exhale as you lay your torso between your thighs and swing your hands forward.\n'),
                          _buildPositions(context,'kakasana', 'Kakasana','For digestion','1.Squat on the floor. Keep both your feet and your knees apart.\n'
                              '\n2.Stretch your arm to place your palms flat against the floor in front. Keep your fingers spread. Bend your arms slightly at the elbows.\n'
                              '\n3.Raise your hips so that your body tilts forward, bringing your head down halfway.\n'
                              '\n4.Let your knees be supported by your upper arms.\n'),
                          _buildPositions(context,'warrior1', 'Virbhadrasana I','For digestion','hh'),
                          _buildPositions(context,'warrior2', 'Virbhadrasana II','For digestion','hh'),
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

class YogaList extends StatefulWidget {
  final String title;
  final String subtitle;
  final String img;
  Function navigate;
  YogaList(@required this.img, @required this.subtitle, @required this.title,
      @required this.navigate);

  @override
  _YogaListState createState() => _YogaListState(img);
}

class _YogaListState extends State<YogaList> {
  int _itemCount = 0;
  Color color = Color.fromRGBO(108, 115, 255, 1);
  Color gradient = Color.fromRGBO(58, 63, 255, 1);

  final String img;

  _YogaListState(this.img);
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
Widget _buildPositions(BuildContext context, String img, String yogaName,String YogSubtitle, String info) {

  return Padding(
      padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
      child: InkWell(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => YogaDetailsPage(heroTag: "images/$img.jpg", yogaName: yogaName,info : info)
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
                                  yogaName,
                                  style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontSize: 17.0,
                                      fontWeight: FontWeight.bold
                                  )
                              ),
                              Center(
                                child: Text("$YogSubtitle",
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
                        builder: (context) => YogaDetailsPage(heroTag: "images/$img.jpg", yogaName: yogaName,info: info)
                    ));
                  }
              )
            ],
          )
      ));
}



