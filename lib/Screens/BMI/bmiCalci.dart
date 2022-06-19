import 'dart:math';

class CalculatorBrain {
  CalculatorBrain({required this.weight, required this.height});

  final int height;
  final int weight;
  double bmi = 0;

  String calculateBMI() {
    bmi = weight.toDouble() / (pow(height.toDouble() / 100, 2));
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
