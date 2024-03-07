import 'dart:developer';
import 'package:lottie/lottie.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spendwise/controllers/firebasecontroller.dart';

import 'package:spendwise/models/transactionmodel.dart';

class Containerlistview extends StatelessWidget {
  Containerlistview({super.key});

  void fetchdata(BuildContext context) {
    Provider.of<FirebaseController>(context, listen: false).fetchdata();
  }

  String dateformat = DateTime.now().toLocal().toString().split(' ')[0];

  bool isincome = true;

  List transaction = [];

  @override
  Widget build(BuildContext context) {
    fetchdata(context);
    return Consumer<FirebaseController>(builder: (context, provider, child) { 
      return StreamBuilder<List<TransactionModel>>(
          stream: provider.fetchdata(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: LottieBuilder.asset('assets/animations/animation1.json',fit: BoxFit.cover,width: 150,height: 150,), 
              );
            } else if (snapshot.data == null || snapshot.data!.isEmpty) {
              return Center(
                  child:LottieBuilder.asset('assets/animations/animation.json',fit: BoxFit.cover,width: 150,height: 150,) );   
            }
            {
              List<TransactionModel> transaction = snapshot.data!;
              log(transaction.toString());
              //  Map<String,List<Map<String,dynamic>>> groupedtransaction={};
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  color: Colors.blueGrey[900],
                  elevation: 10,
                  child: ListView.separated(
                      separatorBuilder: (context, index) => Container(
                            height: 5,
                            color: Colors.white,
                          ),

                      //  scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: transaction.length,
                      itemBuilder: (context, index) {
                        TransactionModel transac = transaction[index];
                        return ListTile(
                          textColor: Colors.white,
                          // tileColor: Colors.grey[800],
                          title: Text(
                            transac.category,
                            style: TextStyle(fontSize: 20),
                          ),

                          trailing: Text(
                            '${transac.amount}',
                            style: TextStyle(fontSize: 18),
                          ),
                          subtitle: Column(
                            //  mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${transac.memo}',
                                style: TextStyle(fontSize: 16),
                              ),
                              Text(
                                transac.date,
                                style: TextStyle(fontSize: 15),
                              )
                            ],
                          ),
                        );
                      }),
                ),
              );

              // return Container(
              //     child: ListView.builder(
              //         physics: NeverScrollableScrollPhysics(),
              //         shrinkWrap: true,
              //         itemCount: transaction
              //             .length, // Replace with your desired item count
              //         itemBuilder: (BuildContext context, int index) {
              //           final trans = transaction[index];
              //           final category = trans['category'];
              //           final amount = trans['amount'];
              //           final date = trans['date'];
              //           final memo = trans['memo'];
              //   return Container(
              //     decoration: BoxDecoration(
              //         color: Colors.transparent,
              //         borderRadius: BorderRadius.circular(20)),
              //     //  height: MediaQuery.of(context).size.height*0., // Adjust the height as needed
              //     margin: EdgeInsets.all(8.0),
              //     //  color: Colors.grey,
              //     child: Column(
              //       children: [
              //         Padding(
              //           padding: const EdgeInsets.all(8.0),
              //           child: Text(
              //             date,
              //             style: TextStyle(fontSize: 22),
              //           ),
              //         ),
              //         Divider(),
              //         ListView.builder(
              //           shrinkWrap: true,
              //           physics: NeverScrollableScrollPhysics(),
              //           itemCount: transaction.length,
              //           // transaction.length, // Replace with your desired inner item count
              //           itemBuilder:
              //               (BuildContext context, int innerIndex) {
              //             return ListTile(
              //               // tileColor: Colors.red,
              //               leading: CircleAvatar(),
              //               title: Text(category),
              //               trailing: Text(amount),
              //               subtitle: Text(memo),
              //               onTap: () {
              //                 // Handle onTap for inner list items
              //               },
              //             );
              //           },
              //         ),
              //       ],
              //     ),
              //   );
            }
          });
    });
  }
}
