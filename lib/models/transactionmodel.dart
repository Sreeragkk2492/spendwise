import 'package:cloud_firestore/cloud_firestore.dart';

class TransactionModel {
  String category;
  String amount;
  String date;
  String memo;
  TransactionModel(
      {required this.category,
      required this.amount,
      required this.memo,
      required this.date});
  // Convert the object to a Map for adding to Firebase
  Map<String, dynamic> toMap() {
    return {'category': category, 'amount': amount, 'memo': memo, 'date': date};
  }

  // Create an instance of the model from a Map retrieved from Firebase
  factory TransactionModel.fromMap(Map<String,dynamic> transaction) {
    return TransactionModel(
        category: transaction['category'],
        amount: transaction['amount'],
        memo: transaction['memo'],
        date: transaction['date']);
  }
}
