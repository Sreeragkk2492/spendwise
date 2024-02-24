

import 'package:flutter/material.dart';



import 'package:spendwise/widgets/animatedbuttonbar.dart';



class Addinex extends StatelessWidget {
  Addinex({super.key});

 
bool isIncome=true;
  @override
  Widget build(BuildContext context) {
   
  

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
             const Text(
                'Add a Transaction',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              Animatedbuttonbar(isincome: isIncome,), 
             
            ],
          ),
        ),
      )),
    );
  }

 
}
