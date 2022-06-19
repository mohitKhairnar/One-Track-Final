import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mini_project_ui/Screens/upgradedr1.dart';

import 'BMI/bmi.dart';


TextStyle get subHeadingStyle {
  return GoogleFonts.lato(
      textStyle: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: Colors.blueGrey[900],
      ));
}

TextStyle get headingStyle {
  return GoogleFonts.lato(
      textStyle: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold,
      ));
}

class FoodPage extends StatefulWidget {
  const FoodPage({Key? key}) : super(key: key);

  @override
  State<FoodPage> createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  DateTime _selectedDate = DateTime.now();
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  final FirebaseAuth auth = FirebaseAuth.instance;
  var bmi;

  void isBMI() async {
    final User? user = auth.currentUser;
    final uid = user?.uid;
    final querySnapshot = await FirebaseFirestore.instance
        .collection('food').doc(uid).get();
    Map<String, dynamic>? data = querySnapshot.data();
    if(data == null){
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => BMIPage(),
        ),
      );
    } else {
      setState(() {
        bmi = data['bmi'];
      });
    }
  }
  @override
  void initState(){
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
      backgroundColor: Color(0xFF21BFBD),
      body: ListView(
        children: <Widget>[
          Container(
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            height: 45,
            width: 100,
            child: Text('Your BMI:$bmi',style: TextStyle(fontSize: 30.0,fontWeight: FontWeight.bold),),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(

              margin: EdgeInsets.symmetric(horizontal: 15),
              height: 110,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: Colors.blueGrey,
                    width: 3,
                  ),
                  boxShadow:[
                    BoxShadow(

                      offset: Offset(0,10),
                      blurRadius: 50,
                      color: Colors.white.withOpacity(0.23),
                    ),
                  ]
              ),
              child: Container(

                // margin: const EdgeInsets.only(top:20,left: 20),
                child: DatePicker(
                  DateTime.now(),
                  height: 95,
                  width: 80,
                  initialSelectedDate: DateTime.now(),
                  selectionColor: Color(0xFF21BFBD),
                  selectedTextColor: Colors.white,
                  dateTextStyle: GoogleFonts.lato(
                    textStyle: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey,
                    ),
                  ),
                  dayTextStyle: GoogleFonts.lato(
                    textStyle: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey,
                    ),
                  ),
                  monthTextStyle: GoogleFonts.lato(
                    textStyle: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey,
                    ),
                  ),
                  onDateChange: (date){
                    _selectedDate = date;
                  },
                ),
              ),

            ),
          ),

          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(top: 0.0, left: 10.0),
              child: SizedBox(height: 10.0),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 40.0),
          ),
          Container(
            height: MediaQuery.of(context).size.height - 282,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(75.0)),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: 55),
                Container(
                  height: 95,
                  width: 205,
                  margin: EdgeInsets.symmetric(vertical: 0, horizontal: 25),
                  decoration: BoxDecoration(
                    color: Color(0xFF21BFBD),
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                  child: FlatButton(
                      height: 90,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => UpDiet(bmi: bmi,),
                          ),
                        );
                      }, // Handle your callback.
                      child: Text(
                        'Diet Plan',
                        style: TextStyle(fontSize: 27),
                      )),
                ),
                SizedBox(height: 35),
                Container(
                  height: 95,
                  width: 205,
                  margin: EdgeInsets.symmetric(vertical: 0, horizontal: 25),
                  decoration: BoxDecoration(
                    color: Color(0xFF21BFBD),
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                  child: FlatButton(
                      height: 90,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BMIPage(),
                          ),
                        );
                      }, // Handle your callback.
                      child: Text(
                        'BMI',
                        style: TextStyle(fontSize: 27),
                      )),
                ),
                SizedBox(height: 35),
                // Container(
                //   height: 95,
                //   width: 205,
                //   margin: EdgeInsets.symmetric(vertical: 0, horizontal: 25),
                //   decoration: BoxDecoration(
                //     color: Color(0xFF21BFBD),
                //     borderRadius: BorderRadius.all(Radius.circular(10.0)),
                //   ),
                //   child: FlatButton(
                //       height: 90,
                //       onPressed: () {
                //         Navigator.push(
                //           context,
                //           MaterialPageRoute(
                //             builder: (context) => ,
                //           ),
                //         );
                //       }, // Handle your callback.
                //       child: Text(
                //         'Past Records',
                //         style: TextStyle(fontSize: 27),
                //       )),
                // ),

              ],
            ),
          ),
        ],
      ),
    );
  }
}
