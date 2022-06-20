import 'dart:async';
import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mini_project_ui/Screens/HomeScreen.dart';
import 'Screens/first_screen.dart';
import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(Home());
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

extension ParseToString on ConnectivityResult {
  String toValue() {
    return toString().split('.').last;
  }
}

class _HomeState extends State<Home> {
  late StreamSubscription _connectivitySubscription;
  bool _isConnectionSuccessful = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _checkConnectivityState();
    _connectivitySubscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) async {
      await _checkConnectivityState();
      setState(() {
        _isConnectionSuccessful = true;
      });
    });
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _connectivitySubscription.cancel();
  }

  Future<void> _checkConnectivityState() async {
    final ConnectivityResult result = await Connectivity().checkConnectivity();

    if (result == ConnectivityResult.wifi && _isConnectionSuccessful == true) {
      Fluttertoast.showToast(msg:'Connected to a Wi-fi network', backgroundColor: Colors.green,);
    } else if (result == ConnectivityResult.mobile && _isConnectionSuccessful == true) {
      Fluttertoast.showToast(msg: 'Connected to a mobile network',backgroundColor: Colors.green,);
    } else {
      if (result == ConnectivityResult.none) {
        Fluttertoast.showToast(msg: "Not connected to any network , Please Connect and Try Again");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
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
    );
  }
}

// (FirebaseAuth.instance.currentUser != null) ? MyApp() : Login(),
