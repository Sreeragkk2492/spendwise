import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class Charts extends StatelessWidget {
  Charts({super.key});

  Map<String, double> datamap = {
    "Salary": 7,
    "Award": 2,
    "grant": 8,
    "Sale": 8,
    "Refund": 0,
    "Lottery": 0,
    "Coupens": 0,
    "Investments": 0,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text('Chart',style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.black,
      ),
      body: Column(
        children: [
          Expanded(
              child: PieChart(
            dataMap: datamap,
            animationDuration: Duration(milliseconds: 800),
            chartLegendSpacing: 32,
            chartRadius: MediaQuery.of(context).size.width / 2.1,
            colorList: [Colors.blue, Colors.red, Colors.green, Colors.yellow],
            initialAngleInDegree: 0,
            chartType: ChartType.ring,
            ringStrokeWidth: 42,
            centerText: "Income ",
            legendOptions: LegendOptions(
              showLegendsInRow: false,
              legendPosition: LegendPosition.right,
              showLegends: true,
              legendShape: BoxShape.rectangle,
              legendTextStyle: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            chartValuesOptions: ChartValuesOptions(
              showChartValueBackground: true,
              showChartValues: true,
              showChartValuesInPercentage: false,
              showChartValuesOutside: false,
              decimalPlaces: 0,
            ),
            // gradientList: ---To add gradient colors---
            // emptyColorGradient: ---Empty Color gradient---
          )),
          Expanded(child:PieChart(
            dataMap: datamap,
            animationDuration: Duration(milliseconds: 800),
            chartLegendSpacing: 32,
            chartRadius: MediaQuery.of(context).size.width / 2.1,
            colorList: [Colors.blue, Colors.red, Colors.green, Colors.yellow],
            initialAngleInDegree: 0,
            chartType: ChartType.ring,
            ringStrokeWidth: 42,
            centerText: "Expence ",
            legendOptions: LegendOptions(
              showLegendsInRow: false,
              legendPosition: LegendPosition.right,
              showLegends: true,
              legendShape: BoxShape.rectangle,
              legendTextStyle: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            chartValuesOptions: ChartValuesOptions(
              showChartValueBackground: true,
              showChartValues: true,
              showChartValuesInPercentage: false,
              showChartValuesOutside: false,
              decimalPlaces: 0,
            ),
            // gradientList: ---To add gradient colors---
            // emptyColorGradient: ---Empty Color gradient---
          ) ),
        ],
      ),
    );
  }
}
