import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CalculatorBrain {
  CalculatorBrain({required this.weight, required this.height});

  final int height;
  final int weight;
  double bmi = 0;
  Future<void> addData()async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    final FirebaseAuth auth = FirebaseAuth.instance;
    final User? user = auth.currentUser;
    final uid = user?.uid;
    firebaseFirestore.collection('food')
        .doc(uid)
        .set({'bmi':bmi.toStringAsFixed(1)});
  }
  String calculateBMI()  {

    bmi = weight.toDouble() / (pow(height.toDouble() / 100, 2));
    addData();
    return bmi.toStringAsFixed(1);
  }

  String getResults() {
    return bmi >= 25
        ? 'Overweight'
        : bmi > 18.5
        ? 'Normal'
        : 'Underweight';
  }

  String getEmoji() {
    return bmi >= 25
        ? 'surprise'
        : bmi > 18.5
        ? 'grin'
        : 'frownOpen';
  }

  String getInterpretation() {
    return bmi >= 25
        ? 'Your weight is higher than normal body weight. Try to exercise.'
        : bmi > 18.5
        ? 'Great! You have a normal body weight.'
        : 'Your weight is lower than normal body weight. You can eat more.';
  }
}
