
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Expensecategory{
final  String name;
final IconData icon;
Expensecategory({required this.name,required this.icon});

static  List<Expensecategory> expenses = [
    Expensecategory(name: 'food', icon: FontAwesomeIcons.bowlFood),
    Expensecategory(name: 'transportation', icon: FontAwesomeIcons.trainSubway),
    Expensecategory(name: 'bills', icon: FontAwesomeIcons.moneyBillTransfer),
    Expensecategory(name: 'home', icon: FontAwesomeIcons.house),
    Expensecategory(name: 'car', icon: FontAwesomeIcons.car),
    Expensecategory(name: 'entertainment', icon: FontAwesomeIcons.gamepad),
    Expensecategory(name: 'shopping', icon: FontAwesomeIcons.shop),
    Expensecategory(name: 'clothing', icon: FontAwesomeIcons.personDress),
    Expensecategory(name: 'insurance', icon: FontAwesomeIcons.shield),
    Expensecategory(name: 'cigerette', icon: FontAwesomeIcons.smoking),
    Expensecategory(name: 'telephone', icon: FontAwesomeIcons.phone),
    Expensecategory(name: 'health', icon: FontAwesomeIcons.suitcaseMedical),
    Expensecategory(name: 'sports', icon: FontAwesomeIcons.dumbbell),
    Expensecategory(name: 'baby', icon: FontAwesomeIcons.babyCarriage),
    Expensecategory(name: 'pet', icon: FontAwesomeIcons.dog),
    Expensecategory(name: 'education', icon: FontAwesomeIcons.school),
    Expensecategory(name: 'travel', icon: FontAwesomeIcons.plane),
    Expensecategory(name: 'gift', icon: FontAwesomeIcons.gifts),
  ];
  static List<Expensecategory> incomes = [
    Expensecategory(name: 'salary', icon: FontAwesomeIcons.wallet),
    Expensecategory(name: 'awards', icon: FontAwesomeIcons.sackDollar),
    Expensecategory(name: 'grant', icon: FontAwesomeIcons.gift),
    Expensecategory(name: 'sale', icon: FontAwesomeIcons.house),
    Expensecategory(name: 'refund', icon: FontAwesomeIcons.car),
    Expensecategory(name: 'lottery', icon: FontAwesomeIcons.car),
    Expensecategory(name: 'coupens', icon: FontAwesomeIcons.car),
    Expensecategory(name: 'investment', icon: FontAwesomeIcons.car),

    

   ];
}

