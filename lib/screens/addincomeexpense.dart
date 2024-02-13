import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:spendwise/models/categorymodel.dart';
import 'package:spendwise/widgets/animatedbuttonbar.dart';
import 'package:spendwise/widgets/authbutton.dart';
import 'package:spendwise/widgets/transactions.dart';

class Addinex extends StatelessWidget {
  Addinex({super.key});

  List<Expensecategory> expenses = [
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

  @override
  Widget build(BuildContext context) {
    showcategorydialog() {
      return showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: Center(
                    child: Text(
                  'Expenses',
                  style: TextStyle(color: Colors.white),
                )),
                backgroundColor: Colors.black,
                content: Container(
                  height: 400,
                  width: 400,
                  child: GridView.builder(
                      itemCount: expenses.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3),
                      itemBuilder: (context, index) => InkWell(
                            onTap: () {},
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 10,
                                ),
                                Icon(
                                  expenses[index].icon,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  expenses[index].name,
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 10),
                                ),
                              ],
                            ),
                          )),
                ),
              ));
    }

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text(
                'Add a Transaction',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              Animatedbuttonbar(),
              SizedBox(
                height: 30,
              ),
              Transactions(
                  onclick: () {
                   showcategorydialog();
                  },
                  icons: FontAwesomeIcons.angleDown,
                  hintText: 'Select category'),
              SizedBox(
                height: 20,
              ),
              Transactions(
                  type: TextInputType.number,
                  onclick: () {},
                  icons: FontAwesomeIcons.dollarSign,
                  hintText: 'Enter amount'),
              SizedBox(
                height: 20,
              ),
              Transactions(
                  onclick: () {},
                  icons: FontAwesomeIcons.pencil,
                  hintText: 'Memo'),
              SizedBox(
                height: 20,
              ),
              Authbutton(
                  colors: Color.fromARGB(255, 218, 18, 3),
                  ontap: () {},
                  title: 'Save transaction',
                  textcolor: Colors.white)
            ],
          ),
        ),
      )),
    );
  }
}
