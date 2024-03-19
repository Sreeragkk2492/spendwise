import 'package:flutter/material.dart';
import 'package:spendwise/services/firebase.dart';
import 'package:spendwise/services/firebasegoogle.dart';
import 'package:spendwise/screens/login.dart';
import 'package:spendwise/screens/widgets/authbutton.dart';
import 'package:spendwise/screens/widgets/bottomnavbar.dart';
import 'package:spendwise/screens/widgets/googlebutton.dart';
import 'package:spendwise/screens/widgets/textbutton.dart';
import 'package:spendwise/screens/widgets/textfieldwidget.dart';

class Signup extends StatelessWidget {
   Signup({super.key});
final usernamecontroller=TextEditingController();
  final emailcontroller=TextEditingController();
  final passwordcontroller=TextEditingController();

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
              decoration:const BoxDecoration(
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
                      SizedBox(
                        height: 10,
                      ),
                      Textfieldwidget(
                        controller: usernamecontroller,
                        hinttext: 'Username',
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Textfieldwidget(
                        controller: emailcontroller,
                        hinttext: 'Email'),
                      SizedBox(
                        height: 20,
                      ),
                      Textfieldwidget(
                        controller: passwordcontroller,
                        hinttext: 'Password'),
                      SizedBox(
                        height: 20,
                      ),
                      Authbutton(
                        colors: Color.fromARGB(255, 218, 18, 3),
                        ontap: () {
                           String email = emailcontroller.text.trim();
                  String password = passwordcontroller.text.trim();
                  FireBaseFunction()
                      .registeruser(email: email, password: password)
                      .then((response) {
                    if (response == null) {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => Loginpage()));
                    } else {
                      ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(content: Text(response)));
                    }
                  });
                        },
                        title: 'REGISTER',
                        textcolor: Colors.white,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Textbuttonwidget(
                          firsttext: 'Already Register?',
                          ontap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => Loginpage()));
                          },
                          buttontext: 'Login'),
                      Divider(
                        height: 10,
                        endIndent: 1,
                      ), 
                      SizedBox(
                        height: 20, 
                      ), 
                      Googlebutton(onclick: () {
                       Firebasegoogle().signinwithgoogle(context); 
                       //Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Bottom()));
                      }),
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
