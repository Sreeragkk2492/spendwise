import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:spendwise/screens/login.dart';
import 'package:spendwise/screens/widgets/bottomnavbar.dart';

class Firebasegoogle{
  //google signin
Future<UserCredential>signinwithgoogle(BuildContext context)async{
    //begin the interactive signin process

    final GoogleSignInAccount? guser=await GoogleSignIn().signIn();

    //obtain auth details from request

    final GoogleSignInAuthentication gauth=await guser!.authentication;

    //create a new credential for the user


    final credential=GoogleAuthProvider.credential(
      accessToken:gauth.accessToken,
      idToken: gauth.idToken
      

      
    );

      UserCredential gcredential = await FirebaseAuth.instance.signInWithCredential(credential);

      // Use the user ID if needed
      final guserid = gcredential.user!.uid; 

    //lets signin
    // UserCredential userCredential=await FirebaseAuth.instance.signInWithCredential(credential);
    // userCredential.user?.photoURL;
  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Bottom()));
    return await FirebaseAuth.instance.signInWithCredential(credential); 
   


  }

Future  <void> signoutgoogle(BuildContext context) async{
   final GoogleSignIn googleSignIn = GoogleSignIn();
  final FirebaseAuth auth = FirebaseAuth.instance; 
  try{ 
    await googleSignIn.signOut();
   await auth.signOut();
   await googleSignIn.disconnect();
 // await signinwithgoogle(context);
  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Loginpage()));
    
  }catch(e){
    print(e);

  }
}
}