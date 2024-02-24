import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Firebasegoogle{
  //google signin
  signinwithgoogle()async{
    //begin the interactive signin process

    final GoogleSignInAccount? guser=await GoogleSignIn().signIn();

    //obtain auth details from request

    final GoogleSignInAuthentication gauth=await guser!.authentication;

    //create a new credential for the user


    final credential=GoogleAuthProvider.credential(
      accessToken:gauth.accessToken,
      idToken: gauth.idToken
      
    );


    //lets signin
    // UserCredential userCredential=await FirebaseAuth.instance.signInWithCredential(credential);
    // userCredential.user?.photoURL;

    return await FirebaseAuth.instance.signInWithCredential(credential);
    


  }

Future  <void> signoutgoogle() async{
   final GoogleSignIn googleSignIn = GoogleSignIn();
  final FirebaseAuth auth = FirebaseAuth.instance;
  try{
    await googleSignIn.signOut();
    await auth.signOut();
    await googleSignIn.disconnect();
    
  }catch(e){
    print(e);

  }
}
}