import 'package:flutter/material.dart';

class Containerlistview extends StatelessWidget {
  const Containerlistview({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
            child: ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 2, // Replace with your desired item count
              itemBuilder: (BuildContext context, int index) {
                return Container( 
                  decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(20)),
                //  height: MediaQuery.of(context).size.height*0., // Adjust the height as needed
                  margin: EdgeInsets.all(8.0),
                //  color: Colors.grey,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Date',style: TextStyle(fontSize: 22),),
                      ),
                      Divider(),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: 10, // Replace with your desired inner item count
                        itemBuilder: (BuildContext context, int innerIndex) {
                          return ListTile(
                            leading: CircleAvatar(),
                            title: Text('Food'),
                            trailing: Text('-500'),
                            onTap: () {
                              // Handle onTap for inner list items
                            },
                          );
                        },
                      ),
                    ],
                  ),
                );
              }
            )
         );
  }
}