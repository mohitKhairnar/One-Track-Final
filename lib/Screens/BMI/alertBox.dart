import 'package:flutter/material.dart';
import 'constants.dart';
import 'inputClass.dart';


class MyAlertBox extends StatefulWidget {
  const MyAlertBox({Key? key,required this.textEditingController, required this.text}) : super(key: key);

  @override
  State<MyAlertBox> createState() => _MyAlertBoxState();
  final TextEditingController textEditingController;
  final String text;
}

class _MyAlertBoxState extends State<MyAlertBox> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Enter your ${widget.text}"),
      content: TextField(
        controller: widget.textEditingController,
        keyboardType: TextInputType.number,
      ),
      actionsPadding: EdgeInsets.all(8),
      actions: [
        InkWell(
          onTap: () {
            setState(() {
              widget.text == "age"
                  ? InputClass.age = widget.textEditingController.text
                  : widget.text == "height"
                  ? InputClass.height = widget.textEditingController.text
                  : InputClass.weight = widget.textEditingController.text;
            });
            widget.textEditingController.text = "";
            Navigator.pop(context);
          },
          child: Container(
            alignment: Alignment.center,
            height: 40,
            width: 60,
            color: kGreenColorShade,
            child: Text(
              "Done",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ],
    );
  }
}
