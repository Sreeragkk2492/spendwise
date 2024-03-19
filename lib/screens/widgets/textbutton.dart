import 'package:flutter/material.dart';

class Textbuttonwidget extends StatelessWidget {
  String firsttext;
  VoidCallback ontap;
  String buttontext;
   Textbuttonwidget({super.key,required this.firsttext,required this.ontap,required this.buttontext});

  @override
  Widget build(BuildContext context) {
    return   Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(firsttext,style: TextStyle(color: Colors.white),),
                        TextButton(
                            onPressed: ontap,
                            child: Text(
                              buttontext,
                              style: TextStyle(
                                  color: Colors.white),
                            ))
                      ],
                    );
  }
}