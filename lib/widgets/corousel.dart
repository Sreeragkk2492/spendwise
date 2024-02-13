import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class Corouselw extends StatelessWidget {
  const Corouselw({super.key});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: [
        Container(
          width: 300,
         // height: 300, 

            
          decoration: BoxDecoration(color: Colors.white), 
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
            
         SizedBox(
          height: 40,
         ),
           
            ],
          ),
        ),
          Container(
          width: 300,
         // height: 300, 

            
          decoration: BoxDecoration(color: Colors.white), 
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.attach_money,size: 80,),
         SizedBox(
          height: 40,
         ),
              Text('hlo')
            ],
          ),
        )
      ],
      options: CarouselOptions(
        height: 400,
        enlargeCenterPage: true,
        autoPlay: false,
        aspectRatio: 16 / 9,
        autoPlayCurve: Curves.fastOutSlowIn,
        enableInfiniteScroll: true,
        autoPlayAnimationDuration: Duration(milliseconds: 800),
        viewportFraction: 0.8,
      ),
    );
  }
}
