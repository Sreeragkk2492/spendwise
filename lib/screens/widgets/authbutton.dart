import 'package:flutter/material.dart';

class Authbutton extends StatelessWidget {
  String title;
  Color colors;
  VoidCallback ontap;
  Color textcolor;

   Authbutton({super.key,required this.colors,required this.ontap,required this.title,required this.textcolor});

  @override
  Widget build(BuildContext context) {
    return  Container(
                        width: 300,
                        height: 40,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(backgroundColor: colors),
                            onPressed: ontap,
                            child: Text(
                              title,
                              style: TextStyle(color: textcolor,fontSize: 18),
                              
                            )));
  }
}