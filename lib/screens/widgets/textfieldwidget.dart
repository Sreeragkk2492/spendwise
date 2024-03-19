import 'package:flutter/material.dart';

class Textfieldwidget extends StatelessWidget {
  String hinttext;
  TextEditingController? controller;
  Textfieldwidget({super.key, required this.hinttext,this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
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
