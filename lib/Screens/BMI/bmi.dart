import 'package:flutter/material.dart';
import 'package:animated_flip_counter/animated_flip_counter.dart';
import 'constants.dart';
import 'heavy_weight.dart';
import 'inputClass.dart';
import 'mybutton.dart';
import 'bmiResult.dart';

class BMIPage extends StatefulWidget {
  const BMIPage({Key? key}) : super(key: key);

  @override
  State<BMIPage> createState() => _BMIPageState();
}

class _BMIPageState extends State<BMIPage> {
  late int height;
  bool isActive = true;
  int _age = 20;

  final TextEditingController _textEditingController = TextEditingController();
  final TextEditingController _heightEditingController =
  TextEditingController();
  final TextEditingController _weightEditingController =
  TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xFF21BFBD),
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
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 38.0, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Text('BMI Calculator',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 45.0,color: Colors.blueGrey),),
              ),
              SizedBox(height: 35),
              Divider(color: kGreenColorShade),
              SizedBox(height: 40),
              Text(
                "Your Age?",
                style: TextStyle(color: Colors.blueGrey,fontSize: 21),
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      // showDialog(
                      //   context: context,
                      //   builder: (context) {
                      //     return MyAlertBox(
                      //         textEditingController: _textEditingController,
                      //         text: "age");
                      //   },
                      // );
                    },
                    child: AnimatedFlipCounter(
                      duration: Duration(milliseconds: 500),
                      value: InputClass.age == "-1"
                          ? _age
                          : int.parse(InputClass.age),
                      textStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 80,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  SizedBox(width: 20),
                  Column(
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            _age += 1;
                          }
                          );
                        },
                        child:
                        Icon(Icons.add, color: Colors.white, size: 50),
                      ),
                      SizedBox(height: 10),
                      InkWell(
                        onTap: () {
                          setState(() {
                            if(_age>0)
                              _age -= 1;
                            else
                              _age=0;
                          });
                        },
                        child: Icon(Icons.remove,
                            color: Colors.white, size: 50),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 40),
              Divider(color: Colors.white),
              SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  HeightWeightColumns(
                    textEditingController: _heightEditingController,
                    text: 'height',
                    value: InputClass.height,
                    unit: ' cm',
                  ),
                  HeightWeightColumns(
                    textEditingController: _weightEditingController,
                    text: 'weight',
                    value: InputClass.weight,
                    unit: ' kg',
                  ),
                ],
              ),
              SizedBox(height: 100),
              MyButton(
                size: size,
                onSubmit: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ResultScreen(),
                    ),
                  );
                },
                text: 'CALCULATE',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
