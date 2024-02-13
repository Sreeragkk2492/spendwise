import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:motion_tab_bar/MotionTabBar.dart';
import 'package:motion_tab_bar/MotionTabBarController.dart';
import 'package:spendwise/screens/addincomeexpense.dart';
import 'package:spendwise/screens/chart.dart';
import 'package:spendwise/screens/home.dart';

class Bottom extends StatefulWidget {
  @override
  State<Bottom> createState() => _BottomState();
}

class _BottomState extends State<Bottom> with TickerProviderStateMixin {
  MotionTabBarController? controller;

  @override
  void initState() {
    controller =
        MotionTabBarController(length: 3, vsync: this, initialIndex: 0);
    super.initState();
  }

  @override
  void dispose() {
    controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(controller: controller, children: [
       Myhome(),
    
       Addinex(),
          Charts()
      
      
      ]),
      bottomNavigationBar: MotionTabBar(
        controller:
            controller, // ADD THIS if you need to change your tab programmatically
        initialSelectedTab: "Home", 
        labels: const ["Home", "stats", "Add"],
        icons: const [
          Icons.home, 
          Icons.add,
          Icons.pie_chart,
         
         
        ],

        // optional badges, length must be same with labels
        // badges: [
        //   // Default Motion Badge Widget
        //   const MotionBadgeWidget(
        //     text: '10+',
        //     textColor: Colors.white, // optional, default to Colors.white
        //     color: Colors.red, // optional, default to Colors.red
        //     size: 18, // optional, default to 18
        //   ),

        //   // custom badge Widget
        //   Container(
        //     color: Colors.black,
        //     padding: const EdgeInsets.all(2),
        //     child: const Text(
        //       '11',
        //       style: TextStyle(
        //         fontSize: 14,
        //         color: Colors.white,
        //       ),
        //     ),
        //   ),

        //   // allow null
        //   null,

        //   // Default Motion Badge Widget with indicator only
        //   const MotionBadgeWidget(
        //     isIndicator: true,
        //     color: Colors.blue, // optional, default to Colors.red
        //     size: 5, // optional, default to 5,
        //     show: true, // true / false
        //   ),
        // ],
        tabSize: 50,
        tabBarHeight: 55,
        textStyle: const TextStyle(
          fontSize: 12,
          color: Colors.black,
          fontWeight: FontWeight.w500,
        ),
        tabIconColor: Colors.grey,
        tabIconSize: 28.0,
        tabIconSelectedSize: 26.0,
        tabSelectedColor: Color.fromARGB(255, 218, 18, 3), 
        tabIconSelectedColor: Colors.white,
        tabBarColor: Colors.black,
        onTabItemSelected: (int value) {
          setState(() {
            // _tabController!.index = value;
            controller!.index = value;
          });
        },
      ),
    );
  }
}
