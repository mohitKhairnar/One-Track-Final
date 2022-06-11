import 'dart:developer';

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:mini_project_ui/Screens/login.dart';
import 'package:mini_project_ui/Screens/first_screen.dart';




Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform,);
  runApp(BackHome());



  // FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // DocumentSnapshot snapshot = await FirebaseFirestore.instance.collection("users").doc("Z3kfNrbsVBlgqPnP94S2").get();
  // log(snapshot.data().toString());

  // Map<String, dynamic> newUserData = {
  //   "name": "SlantCode",
  //   "email": "slantcode@gmail.com"
  // };
  // await _firestore.collection("users").doc("your-id-here").update({
  //   "email": "slantcode2@gmail.com"
  // });
  // log("User updated!");

  // await _firestore.collection("users").doc("Z3kfNrbsVBlgqPnP94S2").delete();
  // log("User deleted!");


}

class BackHome extends StatelessWidget {
  const BackHome({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: (FirebaseAuth.instance.currentUser != null) ? LoginScreen() : LoginScreen(),
    );
  }
}