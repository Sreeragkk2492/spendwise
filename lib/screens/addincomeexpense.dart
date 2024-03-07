import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:spendwise/controllers/cardprovider.dart';
import 'package:spendwise/controllers/firebasecontroller.dart';
import 'package:spendwise/models/categorymodel.dart';

import 'package:spendwise/widgets/authbutton.dart';
import 'package:spendwise/widgets/transactions.dart';

class Addinex extends StatefulWidget {
  Addinex({super.key});

  @override
  State<Addinex> createState() => _AddinexState();
}

class _AddinexState extends State<Addinex> {
  final categorycontroller = TextEditingController();

  final amountcontroller = TextEditingController();
  List<Expensecategory> income = Expensecategory.incomes;
  final datecontroller = TextEditingController();
  List<Expensecategory> Expence = Expensecategory.expenses;
  final memocontroller = TextEditingController();
  IconData? icon;
  String textincome = '';
  String textexpense = '';
  List<Expensecategory> name = [];

  bool isIncome = true;
  String dateformat = DateTime.now().toLocal().toString().split(' ')[0];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    setState(() {
      datecontroller.text = dateformat;
    });

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const Text(
                  'Add a Transaction',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                SizedBox(
                  height: size.height * 0.06,
                ),
                Transactions(
                    onclick: () {
                      showcategorydialog();
                    },
                    icons: FontAwesomeIcons.plus,
                    hintText: 'category',
                    controller: categorycontroller),
                SizedBox(
                  height: size.height * 0.02,
                ),
                Transactions(
                    type: TextInputType.number,
                    onclick: () {},
                    icons: FontAwesomeIcons.dollarSign,
                    hintText: 'amount',
                    controller: amountcontroller),
                SizedBox(
                  height: size.height * 0.02,
                ),
                Transactions(
                    onclick: () {},
                    icons: FontAwesomeIcons.calendar,
                    hintText: '',
                    controller: datecontroller),
                SizedBox(
                  height: size.height * 0.02,
                ),
                Transactions(
                    onclick: () {},
                    icons: FontAwesomeIcons.pen,
                    hintText: 'memo',
                    controller: memocontroller),
                SizedBox(
                  height: size.height * 0.02,
                ),
                Authbutton(
                    colors: Color.fromARGB(255, 218, 18, 3),
                    ontap: () {
                      if (categorycontroller.text.isEmpty ||
                          amountcontroller.text.isEmpty) {
                        showDialog(
                            context: context,
                            builder: (context) => const AlertDialog(
                                  backgroundColor: Colors.black,
                                  content: Text(
                                    'please enter the fields',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ));
                      } else {
                        FirebaseController()
                            .addData(
                                categorycontroller.text,
                                amountcontroller.text,
                                datecontroller.text,
                                memocontroller.text)
                            .then((response) {
                          if (response == null) {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                                    backgroundColor: Colors.blue,
                                    content: Text(
                                      'transaction successfull',
                                      style: TextStyle(color: Colors.white),
                                    )));
                            // showDialog(context: context, builder: (context)=>AlertDialog(content: Text('hh'),));
                            //  Navigator.pop(context);
                          } else {
                            showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                      content: Text(response),
                                    ));
                          }
                        });
                        // showDialog(context: context, builder: (context)=> AlertDialog(
                        //   title: Text('transaction added succesfully'),
                        // ));

                        Provider.of<TransactionProvider>(context, listen: false)
                            .avlabalance; 
                            Provider.of<TransactionProvider>(context,listen: false).expence;

                        categorycontroller.clear();
                        amountcontroller.clear();
                        memocontroller.clear();
                      }
                    },
                    title: 'Save transaction',
                    textcolor: Colors.white),
              ],
            ),
          ),
        ),
      )),
    );
  }

  showcategorydialog() {
    return showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: const Center(
                  child: Text(
                'Expences',
                style: TextStyle(color: Colors.white),
              )),
              backgroundColor: Colors.black,
              content: Container(
                height: 400,
                width: 400,
                child: Column(
                  children: [
                    Expanded(
                      child: GridView.builder(
                          itemCount: Expence.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3),
                          itemBuilder: (context, index) => InkWell(
                                onTap: () {
                                  onselectedexpenses(context, Expence[index]);
                                  Navigator.pop(context);
                                },
                                child: Column(
                                  children: [
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Icon(
                                      Expence[index].icon,
                                      color: Colors.red,
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      Expence[index].name.toString(),
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 10),
                                    ),
                                  ],
                                ),
                              )),
                    ),
                    const Divider(),
                    const Text(
                      'Incomes',
                      style: TextStyle(color: Colors.white, fontSize: 24),
                    ),
                    Expanded(
                      child: GridView.builder(
                          itemCount: income.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3),
                          itemBuilder: (context, index) => InkWell(
                                onTap: () {
                                  onselecetedincomes(context, income[index]);
                                  Navigator.pop(context);
                                },
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Icon(
                                      income[index].icon,
                                      color: Colors.blue,
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      income[index].name.toString(),
                                      style: const TextStyle(
                                          color: Colors.white, fontSize: 10),
                                    ),
                                  ],
                                ),
                              )),
                    )
                  ],
                ),
              ),
            ));
  }

  void onselectedexpenses(BuildContext context, Expensecategory expence) {
    setState(() {
      icon = expence.icon;
      textexpense = expence.name.toString();
      categorycontroller.text = textexpense;
    });
  }

  void onselecetedincomes(BuildContext context, Expensecategory income) {
    setState(() {
      icon = income.icon;
      textincome = income.name.toString();
      categorycontroller.text = textincome;
      print(categorycontroller.text);
    });
  }
}
