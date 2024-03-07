
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:spendwise/models/categorymodel.dart';
import 'package:spendwise/models/transactionmodel.dart';

class TransactionProvider extends ChangeNotifier {
  final Expensecategory category=Expensecategory();
  double _amount = 0;
 
  double _avlbalance=0.0;
  double _expenses=0.0;
   double _income=0.0;
 late TransactionModel transmodel;

double get avlbalance=>_avlbalance;
double get expenses=>_expenses;
double get incomes=>_income;
//List get transactions=>_transactions;
  double get amountvalues => _amount;

 
  void avlabalance(){
    if(category.type==transactiontype.income ){ 
      _avlbalance += transmodel.amount as double;
     
    }else{
       _avlbalance -=transmodel.amount as double;
    }
    notifyListeners();
    

  }
  void expence(){
    if(transmodel.category.contains('food')){
      _expenses -=transmodel.amount as double;
    }
  }
  
}
