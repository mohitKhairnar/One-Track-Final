import 'package:flutter/material.dart';
import 'package:animated_flip_counter/animated_flip_counter.dart';
import 'alertBox.dart';

class HeightWeightColumns extends StatelessWidget {
  const HeightWeightColumns({Key? key,required this.textEditingController,
    required this.text,
    required this.value,
    required this.unit,}) : super(key: key);
  final TextEditingController textEditingController;
  final String text, value, unit;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Your $text?",
          style: TextStyle(color: Colors.blueGrey,fontSize: 21),
        ),
        Row(
          children: [
            InkWell(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return MyAlertBox(
                      textEditingController: textEditingController,
                      text: text,
                    );
                  },
                );
              },
              child: AnimatedFlipCounter(
                duration: Duration(milliseconds: 500),
                value: int.parse(value),
                textStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 70,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Text(
              unit,
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ],
        ),
      ],
    );
  }
}

