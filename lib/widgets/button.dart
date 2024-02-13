import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  VoidCallback ontap;
  IconData icon;
  Color colors;
  String title;

   Button({super.key,required this.ontap,required this.colors,required this.icon,required this.title});

  @override
  Widget build(BuildContext context) {
    return  Container(
                      width: 200,
                      height: 40,
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 9, 236, 206),
                          borderRadius: BorderRadius.circular(20)),
                      child: ElevatedButton(
                        onPressed: ontap,
                        child: Row(
                          children: [
                            Text(
                              title,
                              style:
                                  TextStyle(color: Colors.black, fontSize: 18),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Icon(
                              icon,
                              color: Colors.black,
                              size: 30,
                            )
                          ],
                        ),
                        style: ElevatedButton.styleFrom(
                            backgroundColor:colors),
                      ),
                    );
  }
}