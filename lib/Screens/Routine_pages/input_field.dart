import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle get titleStyle{
  return GoogleFonts.lato(
      textStyle: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,

      )
  );
}
TextStyle get subTitleStyle{
  return GoogleFonts.lato(
      textStyle: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: Colors.blueGrey[900],
      )
  );
}
class MyInputField extends StatelessWidget {
  final String title;
  final String hint;
  final TextEditingController? controller;
  final Widget? widget;
  const MyInputField({Key? key,
    required this.title,
    required this.hint,
    this.controller,
    this.widget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top:16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style:titleStyle,
          ),

          Container(
            height: 52,
            margin: EdgeInsets.only(top: 8.0,),
            padding: EdgeInsets.only(left: 14),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black,
                width: 1.0,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(

                    readOnly: widget==null?false:true,
                    autofocus: false,
                    cursorColor: Colors.grey[600],
                    controller: controller,
                    style: subTitleStyle,
                    decoration: InputDecoration(
                      hintText: hint,
                      hintStyle: subTitleStyle,
                      // enabledBorder: UnderlineInputBorder(
                      //   borderSide: BorderSide(color:Colors.black,width: 2)
                      // ),
                      // focusedBorder: UnderlineInputBorder(
                      //   borderSide: BorderSide(
                      //     width: 1,
                      //   )
                      // ),
                      // enabledBorder: UnderlineInputBorder(
                      //   borderSide: BorderSide(
                      //     width: 2,
                      //   )
                      // )
                    ),
                  ),
                ),
                widget == null?Container():Container(child: widget),
              ],
            ),
          )
        ],
      ),
    );
  }
}