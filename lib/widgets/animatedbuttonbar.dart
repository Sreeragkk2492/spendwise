import 'package:animated_button_bar/animated_button_bar.dart';
import 'package:flutter/material.dart';

class Animatedbuttonbar extends StatelessWidget {
  const Animatedbuttonbar({super.key});

  @override
  Widget build(BuildContext context) {
    return   AnimatedButtonBar(  
              radius: 32.0,  
              padding: const EdgeInsets.all(16.0),  
              backgroundColor: Colors.grey,  
              foregroundColor: Colors.black,  
              elevation: 24,  
              borderColor: Colors.grey,  
              borderWidth: 2,  
              innerVerticalPadding: 16,  
              children: [  
                ButtonBarEntry(onTap: () => print('First item tapped'), child: Text('Income',style: TextStyle(color: Colors.white),)),  
                ButtonBarEntry(onTap: () => print('Second item tapped'), child: Text('Expense',style: TextStyle(color: Colors.white),)),  
              ],  
            );  
            
        
  }
}