import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spendwise/controllers/cardprovider.dart';
import 'package:spendwise/controllers/firebasecontroller.dart';
import 'package:spendwise/controllers/splashprovider.dart';
import 'package:spendwise/screens/splash.dart';
import 'package:spendwise/screens/welcome.dart';
import 'package:spendwise/screens/widgets/bottomnavbar.dart';

void main() async {
  await WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: 'AIzaSyBOA6MGO0g5DRmwLEP8V6uhch-z8MTFg8k',
          appId: "1:698290218274:android:16f53382d073f74445717b",
          messagingSenderId: "",
          projectId: "spendwise-7c1e1",
          storageBucket: 'spendwise-7c1e1.appspot.com'));
 
  // User? user=FirebaseAuth.instance.currentUser;

  runApp(Myapp());
}


class Myapp extends StatelessWidget {
  const Myapp({super.key});

 
  @override
  Widget build(BuildContext context) {
    
    return MultiProvider(
        providers: [
           ChangeNotifierProvider(
      create: (context) => SplashProvider(),) ,
       ChangeNotifierProvider(
      create: (context) => TransactionProvider(),) ,
       ChangeNotifierProvider(
      create: (context) => FirebaseController(),)  
        ],
        child: MaterialApp(
          home: Consumer<SplashProvider>(
            builder: (context, SplashProvider, child) {
              User? user = FirebaseAuth.instance.currentUser;
              Widget initialScreen = user != null ? Bottom() : const Welcome();
              return SplashProvider.isSplashDone ? initialScreen : Splash();
            },
          ),
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              textTheme:
                  Theme.of(context).textTheme.apply(fontFamily: 'Roboto')),
        ));
  }
}
