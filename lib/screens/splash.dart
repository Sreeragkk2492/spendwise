import 'package:flutter/material.dart';
import 'package:spendwise/screens/welcome.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {

  @override
  void initState() {
   gotowelcomescreen();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
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
  
  void gotowelcomescreen() async{
    await Future.delayed(Duration(seconds: 1));
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>Welcome()));
  }
}
