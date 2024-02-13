import 'package:flutter/material.dart';
import 'package:spendwise/screens/signup.dart';
import 'package:spendwise/widgets/authbutton.dart';
import 'package:spendwise/widgets/googlebutton.dart';
import 'package:spendwise/widgets/heading.dart';
import 'package:spendwise/widgets/textbutton.dart';
import 'package:spendwise/widgets/textfieldwidget.dart';

class Loginpage extends StatelessWidget {
  const Loginpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 300,
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 218, 18, 3),
                  borderRadius:
                      BorderRadius.vertical(bottom: Radius.elliptical(20, 20))),
              child: Column(
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/images/auth.png'),
                            fit: BoxFit.cover)),
                  ),
                  Text(
                    'SpendWise',
                    style: TextStyle(
                        fontSize: 25, color: Colors.white, letterSpacing: 2),
                  ),
                  Text(
                    'Track your expense and income easly!',
                    style: TextStyle(color: Colors.white),
                  )
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 550,
              decoration: BoxDecoration(color: Colors.black),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      //   Heading(title: 'Login'),
                      SizedBox(
                        height: 10,
                      ),

                      Textfieldwidget(hinttext: 'Email'),
                      SizedBox(
                        height: 20,
                      ),
                      Textfieldwidget(hinttext: 'Password'),
                      SizedBox(
                        height: 20,
                      ),
                      Authbutton(
                        colors: Color.fromARGB(255, 218, 18, 3),
                        ontap: () {},
                        title: 'LOGIN',
                        textcolor: Colors.white,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Textbuttonwidget(
                          firsttext: 'Dont have an account?',
                          ontap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => Signup()));
                          },
                          buttontext: 'Sign Up'),
                      Divider(
                        height: 10,
                        endIndent: 1,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Googlebutton(onclick: () {}),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
