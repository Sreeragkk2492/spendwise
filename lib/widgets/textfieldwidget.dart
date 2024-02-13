import 'package:flutter/material.dart';

class Textfieldwidget extends StatelessWidget {
  String hinttext;
  Textfieldwidget({super.key, required this.hinttext});

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: Colors.black,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.grey,
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.transparent,
              ),
              borderRadius: BorderRadius.circular(30)),
          hintText: hinttext,
          hintStyle: TextStyle(color: Colors.white),
          border: OutlineInputBorder(
              borderSide: BorderSide(),
              borderRadius: BorderRadius.circular(30))),
    );
  }
}
