import 'package:path/path.dart';
import 'yoga_details.dart';
import 'package:flutter/material.dart';
import 'package:mini_project_ui/Screens/fitness_pages/yoga_details.dart';
import 'package:mini_project_ui/Screens/fitness_pages/sports_details.dart';
import 'package:mini_project_ui/Screens/moneyPage.dart';
import 'package:mini_project_ui/Screens/routine.dart';
import '../fitnessPage.dart';

class SportsPage extends StatefulWidget {
  const SportsPage({Key? key}) : super(key: key);

  @override
  _SportsPageState createState() => _SportsPageState();
}

class _SportsPageState extends State<SportsPage> {
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
                Text('Sports',
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
                          _buildPositions(context,'tennis', 'Tennis','Good Health','\nTennis serve and rules\n'
                              '\n1.A tennis match begins with the umpire doing a coin toss. The player who wins the toss can choose to serve, receive or pick the side from which they want to start the match.\n'
                              '\n2.The serving player has to stand behind the baseline of his side of the tennis court and within the bounds of the centre mark and the sideline.\n'
                              '\n3.For a successful serve, the server has to toss the ball up with his non-playing hand and hit it with the racket before it bounces. The ball needs to cross the net and land within the serving area which is marked on the diagonally opposite side of the court for it to be deemed a legal serve.\n'
                              '\n4.Each player is allowed two serves per point. If a player hits the net, or the ball’s first bounce occurs outside the serving area, its called a service fault and the server has a second serve to initiate the point.\n'
                              '\n5.If the server’s foot touches the baseline or goes out of bounds of the sideline, it is known as a foot fault and the server will have a second serve.\n'
                              '\n6.If a player commits a fault on his second serve also, it is called a double fault and the receiving player gets that point.\n'
                              '\n7.However, if a player’s serve hits the net and lands within the serving area, then the server will still have two serves to initiate the point. This situation is known as let.\n'
                              '\n8.The server has to alternate between the vertical halves of the tennis court for each point.\n'
                              '\n9.If the server manages to land a legal serve and the receiver is unable to return the ball, it is known as an ace and the server gets the point.\n',180),
                          _buildPositions(context,'football', 'Football','Good Health','\nFootball rules\n'
                              '\n1.A match consists of two 45 minutes halves with a 15 minute rest period in between.\n'
                              '\n2.Each team can have a minimum off 11 players (including 1 goalkeeper who is the only player allowed to handle the ball within the 18 yard box) and a minimum of 7 players are needed to constitute a match.\n'
                              '\n3.The field must be made of either artificial or natural grass. The size of pitches is allowed to vary but must be within 100-130 yards long and 50-100 yards wide. The pitch must also be marked with a rectangular shape around the outside showing out of bounds, two six yard boxes, two 18 yard boxes and a centre circle. A spot for a penalty placed 12 yards out of both goals and centre circle must also be visible.\n'
                              '\n4.The ball must have a circumference of 58-61cm and be of a circular shape.\n'
                              '\n5.Each team can name up to 7 substitute players. Substitutions can be made at any time of the match with each team being able to make a maximum of 3 substitutions per side. In the event of all three substitutes being made and a player having to leave the field for injury the team will be forced to play without a replacement for that player.\n'
                              '\n6.If the game needs to head to extra time as a result of both teams being level in a match then 30 minutes will be added in the form of two 15 minute halves after the allotted 90 minutes.\n'
                              '\n7.If teams are still level after extra time then a penalty shootout must take place.\n'
                              '\n8.The whole ball must cross the goal line for it to constitute as a goal.\n'
                              '\n9.If a ball goes out of play off an opponent in either of the side lines then it is given as a throw in. If it goes out of play off an attacking player on the base line then it is a goal kick. If it comes off a defending player it is a corner kick.\n',120),
                          _buildPositions(context,'basketball', 'BasketBall','Good Health','\nBasketball rules\n'
                              '\n1.Each team can have a maximum of 5 players on the court at any one time. Substitutions can be made as many times as they wish within the game.\n'
                              '\n2.The ball can only be moved by either dribbling (bouncing the ball) or passing the ball. Once a player puts two hands on the ball (not including catching the ball) they cannot then dribble or move with the ball and the ball must be passed or shot.\n'
                              '\n3.After the ball goes into a team’s half and they win possession back the ball must then make it back over the half way line within 10 seconds. If the ball fails to do so then a foul will be called and the ball will be turned over.\n'
                              '\n4.Each team has 24 seconds to at least shot at the basket. A shot constitutes either going in the basket or hitting the rim of the basket. If after the shot is taken and the ball fails to go in the basket then the shot clock is restarted for another 24 seconds.\n'
                              '\n5.The team trying to score a basket is called the offence whilst the team trying to prevent them from scoring is called the defence. The defence must do all they can to stop the offence from scoring by either blocking a shot or preventing a shot from being fired.\n'
                              '\n6.After each successful basket the ball is then turned over to the opposition.\n'
                              '\n7.Fouls committed throughout the game will be accumulated and then when reached a certain number will be eventually be awarded as a free throw. A free throw involves one playerfrom the offensive team (the player fouled) to take a shot unopposed from the free throw line. Depending on where the foul was committed will depend on the number free throws a player gets.\n'
                              '\n8.Violations in basketball include travelling (taking more than one step without bouncing the ball), double dribble (picking the ball up dribbling, stopping then dribbling again with two hands), goaltending (a defensive player interferes with the ball travelling downwards towards the basket) and back court violation (once the ball passes the half way line the offensive team cannot take the ball back over the half way line).\n'
                              '\n9.If a ball goes out of play off an opponent in either of the side lines then it is given as a throw in. If it goes out of play off an attacking player on the base line then it is a goal kick. If it comes off a defending player it is a corner kick.\n',120),
                          _buildPositions(context,'cricket', 'Cricket','Good Health','\nCricket rules\n'
                              '\n1.Each team is made up of 11 players.\n'
                              '\n2.The bowler must bowl 6 legal deliveries to constitute an over.\n'
                              '\n3.A game must have two umpires stood at either end of the wicket. The umpires then must count the number of balls in the over, make decisions on whether the batsmen is out after an appeal and also check that the bowler has bowled a legal delivery.\n'
                              '\n4.A batsmen can be given out by either being bowled ( the ball hitting their stumps), caught (fielder catches the ball without it bouncing), Leg Before Wicket (the ball hits the batsmen’s pads impeding its line into the stumps), stumped (the wicket keeper strikes the stumps with their gloves whilst the batsmen is outside of their crease with ball in hand), hit wicket (the batsmen hits their own wicket), Handled ball ( the batsmen handles the cricket ball on purpose), timed out (the player fails to reach the crease within 30 seconds of the previous batsmen leaving the field), hit ball twice (batsmen hits the cricket ball twice with their bat) and obstruction ( the batsmen purposely prevents the fielder from getting the ball).\n'
                              '\n5.Test cricket is played over 5 days where each team has two innings (or two chances to bat).\n'
                              '\n6.The scores are then cumulative and the team with the most runs after each innings is the winner.\n'
                              '\n7.One Day cricket in played with 50 overs. Each team has 50 overs to bat and bowl before swapping and doing the previous discipline. The team with the most runs at the end of the game wins.\n'
                              '\n8.International games will have a further two umpires known as the third and fourth umpire. These are in place to review any decisions that the on field umpires are unable to make.\n'
                              '\n9.The fielding team must have one designated wicket keeper who is the only person allow to wear pads and gloves on the field. The wicket keeper stands behind the opposite end to the bowler to catch the ball.\n',120),
                          _buildPositions(context,'volleyball', 'Volleyball','Good Health','\nVolleyball rules\n'
                              '\n1.Each team consist of 6 players and 6 substitutes. Players can be substituted at any time but if they are to return can only be swapped for the player that replaced them.\n'
                              '\n2.Each team can hit the ball up to three times before the ball must be returned. The defensive team can then try and block or return the ball again hitting it a maximum of three times.\n'
                              '\n3.Games are played up to 25 points and must be won by 2 clear points.\n'
                              '\n4.Violations will be called for the following:\n'
                              '\n (i) Stepping over the base line when serving the ball.\n'
                              '\n (ii) Ball hits the net and fails to get over the net (If the ball hits the net and still goes over the net then this is perfectly legal).\n'
                              '\n (iii) Players are not allowed to carry, palm or run with the ball.\n'
                              '\n (iv) Players must not touch the net with any part of the body. If the net is said to have hit them rather than vice-versa, then this is ok.\n'
                              '\n (v) The ball cannot travel under the net.\n'
                              '\n (vi) Players cannot reach over the net and hit the ball.\n',120),
                          _buildPositions(context,'Badminton', 'Badminton','Good Health','\nBadminton rules\n'
                              '\n1.A game can take place with either two (singles) or four (doubles) players.\n'
                              '\n2.An official match has to be played indoors on the proper court dimensions. The dimensions are 6.1m by 13.4m, The net is situated through the middle of the court and is set at 1.55m.\n'
                              '\n3.To score a point the shuttlecock must hit within the parameters of the opponents court.\n'
                              '\n4.If the shuttlecock hits the net or lands out then a point is awarded to your opponent.\n'
                              '\n5.Players must serve diagonally across the net to their opponent. As points are won then serving stations move from one side to the other. There are no second serves so if your first serve goes out then your opponent wins the point.\n'
                              '\n6.A serve must be hit underarm and below the servers waist. No overarm serves are allowed.\n'
                              '\n7.Each game will start with a toss to determine which player will serve first and which side of the court the opponent would like to start from.\n'
                              '\n8.Once the shuttlecock is ‘live’ then a player may move around the court as they wish. They are permitted to hit the shuttlecock from out of the playing area.\n'
                              '\n9.If a player touches the net with any part of their body or racket then it is deemed a fault and their opponent receives the point.\n'
                              '\n10.A fault is also called if a player deliberately distracts their opponent, the shuttlecock is caught in the racket then flung, the shuttlecock is hit twice or if the player continues to infract with the laws of badminton.\n'
                              '\n11.Each game is umpired by a referee on a high chair who overlooks the game. There are also line judges who monitor if the shuttlecock lands in or not. The referee has overriding calls on infringements and faults.\n',120),
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

class SportsList extends StatefulWidget {
  final String title;
  final String subtitle;
  final String img;
  Function navigate;
  SportsList(@required this.img, @required this.subtitle, @required this.title,
      @required this.navigate);

  @override
  _SportsListState createState() => _SportsListState(img);
}

class _SportsListState extends State<SportsList> {
  int _itemCount = 0;
  Color color = Color.fromRGBO(108, 115, 255, 1);
  Color gradient = Color.fromRGBO(58, 63, 255, 1);

  final String img;

  _SportsListState(this.img);
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
Widget _buildPositions(BuildContext context, String img, String sportName,String SportSubtitle,String sportsinfo, int time) {

  return Padding(
      padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
      child: InkWell(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => SportDetailsPage(heroTag: "images/$img.jpg", sportName: sportName,sportinfo: sportsinfo, t:time)
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
                                  sportName,
                                  style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontSize: 17.0,
                                      fontWeight: FontWeight.bold
                                  )
                              ),
                              Center(
                                child: Text("$SportSubtitle",
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
                        builder: (context) => SportDetailsPage(heroTag: "images/$img.jpg", sportName: sportName,sportinfo:sportsinfo,t:time)
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
