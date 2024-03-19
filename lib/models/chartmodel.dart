import 'package:flutter/material.dart';

class ChartModel{
  final String category;
  final int amount; 
  final Color? color;

  ChartModel(this.category,this.amount,[this.color]);

  factory ChartModel.fromfirebase(Map<String,dynamic> data){
 return ChartModel(data['category'],int.parse(data['amount'])); 
  }

}