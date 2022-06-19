import 'package:flutter/material.dart';
import 'inputClass.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'bmiCalci.dart';
import 'mybutton.dart';

class ResultScreen extends StatefulWidget {
  const ResultScreen({Key? key}) : super(key: key);

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  CalculatorBrain calculatorBrain = CalculatorBrain(
    height: int.parse(InputClass.height),
    weight: int.parse(InputClass.weight),
  );

  String result = "", interpretation = "", bmi = "";

  @override
  void initState() {
    print(InputClass.height);
    print(InputClass.weight);
    CalculatorBrain calculatorBrain = CalculatorBrain(
      height: int.parse(InputClass.height),
      weight: int.parse(InputClass.weight),
    );
    bmi = calculatorBrain.calculateBMI();

    result = calculatorBrain.getResults();
    interpretation = calculatorBrain.getInterpretation();

    super.initState();
  }
  Widget build(BuildContext context) {
    bmi = calculatorBrain.calculateBMI();

    IconData iconPro() {
      return calculatorBrain.getEmoji() == 'surprise'
          ? FontAwesomeIcons.surprise
          : calculatorBrain.getEmoji() == 'frownOpen'
          ? FontAwesomeIcons.frownOpen
          : FontAwesomeIcons.grin;
    }
    return Scaffold(
      backgroundColor: Colors.white24,
      appBar: AppBar(
        backgroundColor:Colors.white12,
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            result,
            style: TextStyle(
              color: Colors.greenAccent,
              fontWeight: FontWeight.bold,
              fontSize: 35,
            ),
          ),
          SizedBox(height: 40),
          Icon(
            iconPro(),
            size: 80.0,
            color: Colors.red,
          ),
          SizedBox(height: 40),
          Text(
            bmi,
            style: TextStyle(
              color: Colors.white,
              fontSize: 90,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 40),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 38.0),
            child: Text(
              interpretation,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          SizedBox(height: 80),
          MyButton(
            size: MediaQuery.of(context).size,
            onSubmit: () {
              Navigator.pop(context);
            },
            text: 'RE-CALCULATE',
          ),
        ],
      ),
    );
  }
}
