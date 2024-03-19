import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:spendwise/controllers/firebasecontroller.dart';
import 'package:spendwise/models/transactionmodel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TransactionProvider extends ChangeNotifier {
  // final Expensecategory category = Expensecategory();
  late SharedPreferences prefs;
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  String? documentid;
  double _amount = 0;

  double _avlbalance = 0.0;
  double _expenses = 0.0;
  double _income = 0.0;
  String? category;

  late TransactionModel transmodel;

  double get avlbalance => _avlbalance;
  double get expenses => _expenses;
  double get incomes => _income;
//List get transactions=>_transactions;
  double get amountvalues => _amount;

  TransactionProvider() {
    getsharedpreference();
  }

  void fetchamount(String amount) async {
    _amount = double.parse(amount);

    notifyListeners();
  }

  void fetchcategory(String categoryies) {
    category = categoryies;
    notifyListeners();
  }

  void getsharedpreference() async {
    prefs = await SharedPreferences.getInstance();
    _avlbalance = prefs.getDouble('avlbalance') ?? 0.0;
    _expenses = prefs.getDouble('expenses') ?? 0.0;
    _income = prefs.getDouble('incomes') ?? 0.0;
    notifyListeners();
  }

  void settosharedpreference() async {
    prefs = await SharedPreferences.getInstance();
    prefs.setDouble('avlbalance', _avlbalance);
    prefs.setDouble('expenses', _expenses);
    prefs.setDouble('incomes', _income);
    notifyListeners();
  }

  void avlabalance() async {
    if (category == 'food' ||
        category == 'transportation' ||
        category == 'bills' ||
        category == 'home' ||
        category == 'car' ||
        category == 'entertainment' ||
        category == 'shopping' ||
        category == 'clothing' ||
        category == 'insurance' ||
        category == 'cigerette' ||
        category == 'telephone' ||
        category == 'health' ||
        category == 'sports' ||
        category == 'baby' ||
        category == 'pet' ||
        category == 'education' ||
        category == 'travel' ||
        category == 'gift') {
      _expenses += _amount as double;
      _avlbalance -= _amount as double;
    } else {
      _avlbalance += _amount as double;
      _income += _amount as double;
    }
    settosharedpreference();
// getcollectiondocumentid();
    notifyListeners();
  }

  void deleteAndUpdateBalances(bool isEmpty) {
    if (category == 'food' ||
        category == 'transportation' ||
        category == 'bills' ||
        category == 'home' ||
        category == 'car' ||
        category == 'entertainment' ||
        category == 'shopping' ||
        category == 'clothing' ||
        category == 'insurance' ||
        category == 'cigerette' ||
        category == 'telephone' ||
        category == 'health' ||
        category == 'sports' ||
        category == 'baby' ||
        category == 'pet' ||
        category == 'education' ||
        category == 'travel' ||
        category == 'gift') {
      _expenses -= _amount;
      _avlbalance += _amount;
      if (isEmpty) {
        _avlbalance = 0.0;
        _expenses = 0.0;
        _income = 0.0;
      }else{
        
      }
    } else {
      _avlbalance -= _amount;
      _income -= _amount;
    }

    notifyListeners();
  }

  void clearshredpreference() async {
    prefs = await SharedPreferences.getInstance();
    prefs.clear();
    notifyListeners();
  }
}
