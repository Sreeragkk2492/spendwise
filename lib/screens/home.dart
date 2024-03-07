import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:spendwise/controllers/cardprovider.dart';
import 'package:spendwise/models/firebasegoogle.dart';
import 'package:spendwise/screens/chart.dart';
import 'package:spendwise/screens/login.dart';
import 'package:spendwise/widgets/authbutton.dart';
import 'package:spendwise/widgets/drawertile.dart';
import 'package:spendwise/widgets/listview.dart';

class Myhome extends StatelessWidget {
  const Myhome({super.key});

  // List<Expensecategory> expence=Expensecategory.expenses;
  bool isgooglesignin() {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      for (UserInfo userInfo in user.providerData) {
        if (userInfo.providerId == 'google.com') {
          return true; // User signed in with Google
        }
      }
    }
    return false;
  }

  Future<String> fetchDisplayName(bool isGoogleUser, User? currentUser) async {
    if (isGoogleUser && currentUser != null) {
      currentUser.reload();
      currentUser.getIdToken();
      currentUser = FirebaseAuth.instance.currentUser;
      return currentUser!.displayName ?? '';
    } else {
      return '';
    }
  }

  draerheaderfun() {
    bool isgoogleuser = isgooglesignin();
    User? currentUser = FirebaseAuth.instance.currentUser;
    return UserAccountsDrawerHeader(
      // // arrowColor: Colors.red,
      // //  currentAccountPictureSize: ,
      // decoration: const BoxDecoration(color: Color.fromARGB(255, 218, 18, 9)),
      // accountName: Text(
      //   isgoogleuser ? FirebaseAuth.instance.currentUser!.displayName! : '',
      //   style:const TextStyle(color: Colors.white),
      // ),
      // accountEmail: Text(''),
      // currentAccountPicture: Container(
      //   width: 60,
      //   height: 60,
      //   decoration: BoxDecoration(
      //       image: DecorationImage(
      //         image: NetworkImage(isgoogleuser
      //             ? FirebaseAuth.instance.currentUser!.photoURL!
      //             : 'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png'),
      //       ),
      //       borderRadius: BorderRadius.circular(40)),
      //   child: SizedBox(),
      // ));
      decoration: const BoxDecoration(color: Color.fromARGB(255, 218, 18, 9)),
      accountName: FutureBuilder(
        future: fetchDisplayName(isgoogleuser, currentUser),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Text('Loading...');
          } else {
            return Text(
              snapshot.data.toString(),
              style: const TextStyle(color: Colors.white),
            );
          }
        },
      ),
      accountEmail: const Text(''),
      currentAccountPicture: Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
              isgoogleuser
                  ? FirebaseAuth.instance.currentUser!.photoURL!
                  : 'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png',
            ),
          ),
          borderRadius: BorderRadius.circular(40),
        ),
        child: const SizedBox(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
        drawer: Drawer(
          backgroundColor: Colors.white,
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              draerheaderfun(),
              Drawertile(
                title: 'Settings',
                icon: FontAwesomeIcons.gear,
                ontap: () {},
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              Drawertile(
                title: 'About us',
                icon: FontAwesomeIcons.rightLong,
                ontap: () {},
              ),
              SizedBox(
                height: size.height * 0.09,
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Authbutton(
                    colors: const Color.fromARGB(255, 218, 18, 3),
                    ontap: () {
                      Firebasegoogle().signoutgoogle(context);
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => Loginpage()));
                    },
                    title: 'Logout',
                    textcolor: Colors.white),
              )
            ],
          ),
        ),
        backgroundColor: Colors.black,
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
          //  leading:Container(
          //   width: 30,
          //   height: 30,
          //   decoration: BoxDecoration(image: DecorationImage(image: NetworkImage(FirebaseAuth.instance.currentUser!.photoURL!)),borderRadius: BorderRadius.circular(20)),
          //  ),
          centerTitle: true,
          title: const Text(
            'SpendWise ',
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),

          backgroundColor: Colors.black,
          automaticallyImplyLeading: true,
        ),
        body: Consumer<TransactionProvider>(
          builder: (context, value, child) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Stack(children: [
                      Container(
                        width: size.width,
                        height: size.height * 0.3,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                tileMode: TileMode.clamp,
                                transform: GradientRotation(15),
                                colors: [
                                  Colors.red.shade900,
                                  Colors.black,
                                  Colors.blueGrey.shade900
                                ]),
                            borderRadius: BorderRadius.circular(20)),
                      ),
                      const Positioned(
                          left: 110,
                          top: 15,
                          child: Text(
                            'Available balance',
                            style: TextStyle(color: Colors.white, fontSize: 22),
                          )),
                      Positioned(
                          top: 45,
                          left: 140,
                          child: Text(
                            '\$ ${value.avlbalance}',
                            style: TextStyle(
                                fontSize: 30, color: Colors.grey[400]),
                          )),
                      const Positioned(
                          left: 20,
                          bottom: 100,
                          child: Text(
                            'Income',
                            style: TextStyle(color: Colors.blue, fontSize: 20),
                          )),
                      const Positioned(
                          right: 20,
                          bottom: 100,
                          child: Text(
                            'Expence',
                            style: TextStyle(color: Colors.red, fontSize: 20),
                          )),
                      Positioned(
                          //  top: 0,
                          left: 15,
                          bottom: 70,
                          child: Text(
                            '\$ ${value.incomes}',
                            style: TextStyle(fontSize: 20, color: Colors.grey),
                          )),
                      Positioned(
                          //  top: 0,
                          //  left: 15,
                          right: 15,
                          bottom: 70,
                          child: Text(
                            '\$ ${value.expenses}',
                            style: TextStyle(fontSize: 20, color: Colors.grey),
                          )),
                      Positioned(
                          bottom: 30,
                          left: 10,
                          child: TextButton(
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => Charts()));
                              },
                              child: const Text(
                                'Details',
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold),
                              ))),
                      Positioned(
                          bottom: 30,
                          right: 10,
                          child: TextButton(
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => Charts()));
                              },
                              child: const Text(
                                'Details',
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold),
                              )))
                    ]),
                  ),
                  const Divider(
                    thickness: 1,
                    endIndent: 6.0,
                    indent: 6,
                    color: Colors.white,
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  // Text('Recent Transactions',style: TextStyle(color: Colors.white),),

                  Containerlistview(),
                ],
              ),
            );
          },
        ));
  }
}
