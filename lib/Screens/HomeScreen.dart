import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mini_project_ui/Screens/Login.dart';
import 'package:slide_to_confirm/slide_to_confirm.dart';

import 'Login.dart';

class HomeScreenPage extends StatefulWidget {
  const HomeScreenPage({Key? key}) : super(key: key);

  @override
  _HomeScreenPageState createState() => _HomeScreenPageState();
}

class _HomeScreenPageState extends State<HomeScreenPage> {
  double translateX = 0.0;
  double translateY = 0.0;
  double myWidth = 0;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(

      body:
      Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/pop.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height:MediaQuery.of(context).size.height-225,
            ),

            ConfirmationSlider(
              height: 60,
              width: 300,

              foregroundColor: Colors.black,
              backgroundColor: Colors.white,
              text: 'Slide to login',
              textStyle: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold
              ),
              shadow: BoxShadow(color: Colors.yellow),
              onConfirmation: () {      Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                      builder: (context) =>  Login()),
                      (Route<dynamic> route) => false); },

            )
          ],
        ),
      ),
    );
  }

}

