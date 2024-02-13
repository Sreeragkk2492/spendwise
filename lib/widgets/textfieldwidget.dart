import 'package:flutter/material.dart';

class Textfieldwidget extends StatelessWidget {
  String hinttext;
   Textfieldwidget({super.key,required this.hinttext});

  @override
  Widget build(BuildContext context) {
    return  TextField(
                      decoration: InputDecoration(
                        
                          hintText: hinttext,
                          hintStyle: TextStyle(color: Colors.white),
                          border: OutlineInputBorder( 
                              borderRadius: BorderRadius.circular(30))),
                    );
  }
}