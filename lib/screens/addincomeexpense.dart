import 'package:flutter/material.dart';
import 'package:spendwise/widgets/animatedbuttonbar.dart';
import 'package:spendwise/widgets/authbutton.dart';
import 'package:spendwise/widgets/transactions.dart';

class Addinex extends StatelessWidget {
  const Addinex({super.key});

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
              Text(
                'Add a Transaction',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              Animatedbuttonbar(),
              SizedBox(
                height: 30,
              ),
              Transactions(
                  onclick: () {},
                  icons: Icons.arrow_drop_down_sharp,
                  hintText: 'category'),
              SizedBox(
                height: 20,
              ),
              Transactions(
                  onclick: () {},
                  icons: Icons.attach_money,
                  hintText: 'Enter amount'),
              SizedBox(
                height: 20,
              ),
              Transactions(
                  onclick: () {},
                  icons: Icons.arrow_drop_down_sharp,
                  hintText: 'Memo'),
              SizedBox(
                height: 20,
              ),
              Authbutton(
                  colors: Color.fromARGB(255, 218, 18, 3),
                  ontap: () {},
                  title: 'Save transaction',
                  textcolor: Colors.white)
            ],
          ),
        ),
      )),
    );
  }
}
