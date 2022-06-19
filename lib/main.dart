import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:mini_project_ui/Screens/HomeScreen.dart';
import 'Screens/first_screen.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
      home: Scaffold(
          body: StreamBuilder<User?>(
              stream: FirebaseAuth.instance.authStateChanges(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return MyApp();
                } else {
                  return HomeScreenPage();
                }
                                      }
                        )
             )
        )
  );
}

// (FirebaseAuth.instance.currentUser != null) ? MyApp() : Login(),
