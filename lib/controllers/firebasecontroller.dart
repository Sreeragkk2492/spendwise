import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:spendwise/controllers/cardprovider.dart';
import 'package:spendwise/models/chartmodel.dart';
import 'package:spendwise/models/transactionmodel.dart';

class FirebaseController extends ChangeNotifier {
  final FirebaseAuth auth = FirebaseAuth.instance;
  late TransactionModel transmodel;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  late CollectionReference transactioncollection;
  late CollectionReference subcollection;
  late CollectionReference fetchcollection;
  String? documentid;

  TransactionProvider provider = TransactionProvider();

  List<TransactionModel> _transactiondata = [];
  List<TransactionModel> get transactiondata => _transactiondata;
  Future<String?> addData(
      String category, String amount, String date, String memo) async {
    String uid = auth.currentUser!.uid;

    transactioncollection = firestore.collection('users');
    // subcollection=transactioncollection.doc().collection('daily_transaction');

    final reponse = transactioncollection
        .doc(uid)
        .collection('transactions')
        .add({
      'category': category,
      'amount': amount,
      'date': date,
      'memo': memo
    });
  }

  Stream<QuerySnapshot<Map<String,dynamic>>> fetchdata() {
    String uid = auth.currentUser!.uid;
    // CollectionReference<Map<String, dynamic>> subcollection =
    //     firestore.collection('users').doc(uid).collection('transactions');

    return firestore
        .collection('users')
        .doc(uid)
        .collection('transactions')
        .snapshots();
  }

  Stream<List<ChartModel>> fetchdatachart() {
    String uid = auth.currentUser!.uid;
    CollectionReference<Map<String, dynamic>> subcollection =
        firestore.collection('users').doc(uid).collection('transactions');

    return subcollection.snapshots().map(
      (querySnapshot) {
        return querySnapshot.docs.map((doc) {
          return ChartModel.fromfirebase(doc.data() as Map<String, dynamic>);
        }).toList();
      },
    );
  }

  void getcollectiondocumentid(String transacid) { 
    String uid = auth.currentUser!.uid;
   firestore.collection('users').doc(uid).collection('transactions').doc(transacid).delete(); 
  }
}
