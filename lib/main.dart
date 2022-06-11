import 'dart:developer';

// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:mini_project_ui/Screens/HomeScreen.dart';
import 'package:mini_project_ui/screens/signup_screen.dart';
import 'Screens/firebase_options.dart';
import 'Screens/Login.dart';
import 'Screens/first_screen.dart';
import 'package:flutter/material.dart';

Future<void> main() async{
    WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
       // home:  (FirebaseAuth.instance.currentUser != null) ? LoginScreen() : SignUpScreen(),
        home: HomeScreenPage(),
  ));
}

// void main() async{
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   runApp(LoginScreen());
// }


  //
  // runApp(
  //     MaterialApp(
  //    initialRoute:"welcome",
  //    routes:{
  //      "welcome":(context)=>LoginScreen(),
  //    },
  //
  // ));




// async {
// WidgetsFlutterBinding.ensureInitialized();
// await Firebase.initializeApp(
// options: DefaultFirebaseOptions.currentPlatform
// );