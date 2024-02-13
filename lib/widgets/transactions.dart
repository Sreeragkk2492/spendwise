import 'package:flutter/material.dart';

class Transactions extends StatelessWidget {
  String hintText;
  VoidCallback onclick;
  IconData icons;
  Transactions(
      {super.key,
      required this.onclick,
      required this.icons,
      required this.hintText});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
          suffixIconColor: Colors.white,
          suffix: InkWell(
              onTap: onclick,
              child: Icon(
                icons,
                color: Colors.white,
              )),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.white)),
    );
  }
}
