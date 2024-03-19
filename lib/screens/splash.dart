import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spendwise/controllers/splashprovider.dart';
import 'package:spendwise/screens/welcome.dart';
import 'package:spendwise/screens/widgets/bottomnavbar.dart';

class Splash extends StatelessWidget {
   Splash({super.key});

  String? email;

  @override
  Widget build(BuildContext context) {
    
      Future.delayed(Duration(seconds: 3), () {
      Provider.of<SplashProvider>(context, listen: false).completeSplash();
    });
    return Scaffold(
      body: Stack(children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(color: Color.fromARGB(255, 9, 236, 206)),
        ),
        Positioned(
          left: 150,
          top: 230, 
            child: Image.asset(
          'assets/images/spendwise.png',
          width: 100, 
          height: 300,
        ))
      ]),
    );
  }

  // void gotowelcomescreen() async{
  //     User? user = FirebaseAuth.instance.currentUser;
  //     Widget initialScreen = user != null ? Bottom() :const Welcome();
  //   await Future.delayed(const Duration(seconds: 1));
  //   Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>initialScreen));
  // }
}
