import 'package:flutter/material.dart';

class Heading extends StatelessWidget {
  String title;
  Heading({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 20),
        )
      ],
    );
  }
}
