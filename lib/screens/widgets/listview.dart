import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spendwise/controllers/cardprovider.dart';
import 'package:spendwise/controllers/firebasecontroller.dart';

import 'package:spendwise/models/transactionmodel.dart';
import 'package:spendwise/screens/listtilepage.dart';

class Containerlistview extends StatelessWidget {
  Containerlistview({super.key});

  void fetchdata(BuildContext context) {
    Provider.of<FirebaseController>(context, listen: false).fetchdata();
  }

  TransactionProvider controller=TransactionProvider();

  String dateformat = DateTime.now().toLocal().toString().split(' ')[0];

  bool isEmpty=false;

  List transaction = [];

  @override
  Widget build(BuildContext context) {
    fetchdata(context);
    return Consumer<FirebaseController>(builder: (context, provider, child) {
      return StreamBuilder<QuerySnapshot<Map<String,dynamic>>>(
          stream: provider.fetchdata(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: LottieBuilder.asset(
                  'assets/animations/animation1.json',
                  fit: BoxFit.cover,
                  width: 150,
                  height: 150,
                ),
              );
            } else if (snapshot.data == null|| snapshot.data!.docs.isEmpty){ 
              isEmpty=true;
              return Center(
                  child: LottieBuilder.asset(
                'assets/animations/animation.json',
                fit: BoxFit.cover,
                width: 150,
                height: 150,
              ));
            }
            {
              List<DocumentSnapshot<Map<String,dynamic>>> transaction = snapshot.data!.docs; 
              log(transaction.toString()); 
              //  Map<String,List<Map<String,dynamic>>> groupedtransaction={};
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.builder(
                
                
                    //  scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: transaction.length,
                    itemBuilder: (context, index) {
                      final transac = transaction[index];
                      final id=transaction[index].id;
                      

                      var transactions=TransactionModel.fromMap(transac.data()!);
                    
                      return InkWell(
                        onTap: () {
                        //  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Listtilepage()));
                        },
                        child: Card( 
                          color: Colors.blueGrey[800],
                          child: ListTile(
                            textColor: Colors.black,
                           // tileColor: Colors.grey[800], 
                            title: Text(
                              transactions.category,
                              style: TextStyle(fontSize: 18),
                            ),
                                          
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  '${transactions.amount}',
                                  style: TextStyle(fontSize: 17),
                                ),
                                IconButton(onPressed: (){
                                  
                                 provider.getcollectiondocumentid(id); 
                                 Provider.of<TransactionProvider>(context,listen: false).deleteAndUpdateBalances(isEmpty);
                                
                                }, icon: Icon(FontAwesomeIcons.trash,color: Colors.red,))
                              ],
                            ),
                            subtitle: Column(
                              //  mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '${transactions.memo}',
                                  style: TextStyle(fontSize: 12),
                                ),
                                Text(
                                  transactions.date,
                                  style: TextStyle(fontSize: 11),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
              );
            }
          });
    });
  }
}
