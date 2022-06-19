import 'package:path/path.dart';
import 'yoga_details.dart';
import 'package:flutter/material.dart';
import 'package:mini_project_ui/Screens/fitness_pages/yoga_details.dart';
import 'package:mini_project_ui/Screens/fitness_pages/sports_details.dart';
import 'package:mini_project_ui/Screens/moneyPage.dart';
import 'package:mini_project_ui/Screens/routine.dart';
import 'package:mini_project_ui/Screens/fitness_pages/workout_details.dart';


import '../fitnessPage.dart';

class WorkoutPage extends StatefulWidget {
  const WorkoutPage({Key? key}) : super(key: key);

  @override
  _WorkoutPageState createState() => _WorkoutPageState();
}

class _WorkoutPageState extends State<WorkoutPage> {
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
                Text('Workout',
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
                          _buildPositions(context,'pushup', 'PushUp','Fit & Fine','\n1)Pushups are an exercise in which a person,keeping a prone position, with the hands palms down under the shoulders, the balls of the feet on the ground, and the back straight, pushes the body up and lets it down by an alternate straightening and bending of the arms\n'
                              '\nPushups Variations:\n'
                              '\n(i) Knee push-ups (great for beginners).\n'
                              '\n(ii) Wall pushups\n'
                              '\n(iii) Incline pushups; This is a slightly tougher push-up variant compared to knee and wall push-ups. Incline push-ups are performed with the hands positioned higher than the feet.\n'
                              '\n(iv) Decline push-ups: require you to keep your legs on a higher plane and hands on the floor. You can use a bench, a box, or any piece of furniture to do this push-up.\n',180,130 ),
                          _buildPositions(context,'leg_raise', 'Leg Raise','Fit & Fine','\nSteps:\n''\n1) Lie on your back, legs straight and together. \n'
                              '\n2) Keep your legs straight and lift them all the way up to the ceiling until your butt comes off the floor. \n'
                              '\n3) Slowly lower your legs back down till they’re just above the floor. Hold for a moment.\n'
                              '\n4) Raise your legs back up. Repeat.\n'
                              '\nPrecautions:\n'
                              '\n1) Do not lift your shoulders up.\n'
                              '\n2) Do not apply pressure on your chest.\n'
                              '\n3) Do not arch your back as you bring the legs down.\n'
                              '\nReps:\n'
                              '\n1) For beginners – 10 to 12\n'
                              '\n2) Intermediate – 25 to 50 reps\n'
                              '\n3) You can do 2 to 3 sets of this exercise during the day.You can do 2 to 3 sets of this exercise during the day.\n'
                              '\nBenefits:\n'
                              '\n1) Helps to lose weight from the legs, and lower abdomen\n'
                              '\n2) Tones, strengthens muscles in your abdomen and legs\n'
                              '\n3) An effective exercise for lower abs\n'
                              '\n4) Can strengthen the hamstrings, calf mucles, and glutes\n'
                              '\n5) It is a great exercise that can be done even while lying down in bed\n'
                              '\n6) Helps improve focus and attention\n',120,100 ),
                          _buildPositions(context,'conc_curl', 'Concentration Curl','Fit & Fine','\nSteps:\n'
                              '\n1)Sit on a bench that’s set at a height so your knees are bent at 90° with your feet flat on the floor.\n'
                              '\n2)Pick up a dumbbell in your right hand and place the back of your upper right arm on the inner part of your right thigh.Your arm should be extended holding the weight off the floor.\n'
                              '\n3)Slowly curl the weight up, only moving your forearms – the position of your upper arm on your thigh will help you keep it still during the exercise.'
                              '\n4)At the top of the move, pause for a beat and squeeze your biceps, then slowly lower the weight back to the start.\n'
                              '\n5)Do all your reps on one arm, then switch to the other.\n',120,100 ),
                          _buildPositions(context,'plank', 'Plank','Fit & Fine','\nSteps:\n'
                              '\n1) Lye down flat on the ground.\n'
                              '\n2) Place your elbow and legs flat (like Push-ups).\n'
                              '\n3) Push your body upward and keep your chin tight to your neck.\n'
                              '\n4) Hold your position for 10 seconds.\n'
                              '\n5) Bring your body downwards and continue this 3 times and then take a break.\n'
                              '\n\n A strong core is much more than six-pack abs. \n'
                              '\nWe use our core muscles unconsciously for several actions in a day ranging from bending and lifting weight, for balance and even to managing our breathing.\n'
                              '\nA weakened core can cause serious injury if ignored.\n'
                              '\nThe plank position helps target the core muscles and give them a good burn to build muscle strength.\n',120,100 ),
                          _buildPositions(context,'Bent_overrow', 'Bent Overrow','Fit & Fine','hhh',120,100 ),
                          _buildPositions(context,'tricep_dip', 'Tricep Dip','Fit & Fine','hhh',120,100 ),
                          _buildPositions(context,'over_ext', 'Overhead Extension','Fit & Fine','hhh',120,100 ),
                          // _buildPositions(context,'bench_press', 'Bench Press'),
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

class WorkoutList extends StatefulWidget {
  final String title;
  final String subtitle;
  final String img;
  Function navigate;
  WorkoutList(@required this.img, @required this.subtitle, @required this.title,
      @required this.navigate);

  @override
  _WorkoutListState createState() => _WorkoutListState(img);
}

class _WorkoutListState extends State<WorkoutList> {
  int _itemCount = 0;
  Color color = Color.fromRGBO(108, 115, 255, 1);
  Color gradient = Color.fromRGBO(58, 63, 255, 1);

  final String img;

  _WorkoutListState(this.img);
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
Widget _buildPositions(BuildContext context, String img, String workoutName,String WorkoutSubtitle,String workoutinfo,int time,int calperh) {
  return Padding(
      padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
      child: InkWell(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => WorkoutDetailsPage(heroTag: "images/$img.jpg", workoutName: workoutName,workoutinfo:workoutinfo,t:time,cp:calperh)
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
                                  workoutName,
                                  style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontSize: 17.0,
                                      fontWeight: FontWeight.bold
                                  )
                              ),
                              Center(
                                child: Text("$WorkoutSubtitle",
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
                        builder: (context) => WorkoutDetailsPage(heroTag: "images/$img.jpg", workoutName: workoutName,workoutinfo:workoutinfo,t:time,cp:calperh)
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
