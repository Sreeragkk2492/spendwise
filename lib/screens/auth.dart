import 'package:flutter/material.dart';
import 'package:spendwise/screens/home.dart';
import 'package:spendwise/screens/login.dart';
import 'package:spendwise/screens/signup.dart';
import 'package:spendwise/screens/welcome.dart';
import 'package:spendwise/widgets/authbutton.dart';
import 'package:spendwise/widgets/bottomnavbar.dart';
import 'package:spendwise/widgets/button.dart';

class Authentication extends StatelessWidget {
  const Authentication({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(color: Color.fromARGB(255, 9, 236, 206)),
          ),
          Positioned(
              top: 350,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 500,
                decoration: BoxDecoration(color: Colors.white),
                child: Column(
                  children: [
                    Text(''),
                    SizedBox(
                      height: 30,
                    ),
                   Authbutton(colors: Color.fromARGB(255, 9, 236, 209), ontap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Signup()));
                   }, title: 'Sign Up',textcolor: Colors.white,),
                   SizedBox(height: 30,),
                   Authbutton(colors: Color.fromARGB(255, 9, 236, 209), ontap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Loginpage()));
                   }, title: 'Login',textcolor: Colors.white,)
                  ],
                ),
              )),
          Positioned(
              top: 140,
              left: 110,
              child: Text(
                'Spend Wise',
                style: TextStyle(fontSize: 30),
              )),
          Positioned(top: 180, left: 160, child: Text('Track Your Expense...')),
          Positioned(
            right: 20,
            top: 40,
            child: TextButton(onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Myhome()));
            }, child: Text('Skip')))
        ],
      ),
    );
  }
}
