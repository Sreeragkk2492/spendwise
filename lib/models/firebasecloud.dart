import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Firebasecloud {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<String?> addincometransactiontodb(String category, String amount,
      String date, String memo,) async {
  
      await firestore
          .collection('transaction')
          .add({
            'category': category,
            'amount': amount,
            'date': date,
            'memo': memo
          });
         
  }

 Future <String?> addexpensetodb(String ecategory, String eamount, String edate, String ememo) async{
  await firestore.collection('transaction').add({
    'ecategory':ecategory,
    'eamount':eamount,
    'edate':edate,
    'ememo':ememo
  });
 }
}
