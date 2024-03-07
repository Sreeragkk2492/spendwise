import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

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
   final List<ChartData> chartData = [
            ChartData('David', 25),
            ChartData('Steve', 38),
            ChartData('Jack', 34),
            ChartData('Others', 52)
        ];

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
              child: SfCircularChart(
                
                        series: <CircularSeries>[
                            // Render pie chart
                            PieSeries<ChartData, String>(
                              dataLabelSettings: DataLabelSettings(isVisible: true,),
                              radius: '90%',
                                dataSource: chartData,
                                pointColorMapper:(ChartData data,  _) => data.color,
                                xValueMapper: (ChartData data, _) => data.x,
                                yValueMapper: (ChartData data, _) => data.y,
                                dataLabelMapper:(ChartData data, _) => data.x ,
                            )
                        ]
                    )
                )
           ] )
         );
        
      
    
  }
}

class ChartData {
   ChartData(this.x, this.y, [this.color]);
        final String x;
        final double y;
        final Color? color; 
}
