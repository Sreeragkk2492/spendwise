
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:spendwise/controllers/firebasecontroller.dart';
import 'package:spendwise/models/chartmodel.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Charts extends StatelessWidget {
  Charts({super.key});

 

  

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
      body: Consumer<FirebaseController>(builder: (context, value, child) {
        return Column(
          children: [
            Expanded(
                child: StreamBuilder<List<ChartModel>>( 
                  stream: value.fetchdatachart(),
                  builder: (context,AsyncSnapshot snapshot) {
                   if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: LottieBuilder.asset(
                  'assets/animations/a.json', 
                  fit: BoxFit.cover,
                  width: 150,
                  height: 150,
                ),
              );
            } else if (snapshot.data == null || snapshot.data!.isEmpty) {
              return Center(
                  child: LottieBuilder.asset(
                'assets/animations/a.json', 
                fit: BoxFit.cover,
                width: 150,
                height: 150,
              ));
            }
            Map<String,dynamic> calcategoryamount={};
            
                  List <ChartModel> chartmodel=snapshot.data!; 
                  chartmodel.forEach((ChartModel) {
                    if(calcategoryamount.containsKey(ChartModel.category)){
                      calcategoryamount[ChartModel.category] += ChartModel.amount;
                    }else{
                      calcategoryamount[ChartModel.category] = ChartModel.amount;
                    }
                  },);
                  List<ChartModel> addedchart=[];
                  calcategoryamount.forEach((category, amount) {
                    addedchart.add(ChartModel(category, amount));
                  },);
        
                    return SfCircularChart(
                      
                              series: <CircularSeries>[
                                  // Render pie chart
                                  PieSeries<ChartModel, String>(
                                    dataLabelSettings: DataLabelSettings(isVisible: true,), 
                                    radius: '90%',
                                      dataSource: addedchart,
                                      pointColorMapper:(ChartModel data,  _) => data.color,
                                      xValueMapper: (ChartModel data, _) => data.category,
                                      // ignore: avoid_types_as_parameter_names
                                      yValueMapper: (ChartModel data, _) => data.amount,
                                      dataLabelMapper:(ChartModel data, _) => data.category , 
                                  )
                              ]
                          );
                  }
                )
                  )
             ] );
      }
       
      )
         );
        
      
    
  }
}


