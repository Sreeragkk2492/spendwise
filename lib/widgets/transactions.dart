import 'package:flutter/material.dart';

class Transactions extends StatelessWidget {
  String hintText;
  VoidCallback onclick;
  IconData icons;
  TextInputType? type;
  TextEditingController? controller;
  String? initialvalue;
  Transactions(
      {super.key,
      required this.onclick,
      required this.icons,
      required this.hintText,
       this.type,required this.controller,this.initialvalue
       });
       

  @override
  Widget build(BuildContext context) {
   
    return TextField(
      controller: controller,
      keyboardType:type ,
      cursorColor: Colors.black,
      decoration: InputDecoration(
      //  helperStyle: TextStyle(color: Colors.white), 
        //  focusColor: Colors.amber,
        
          focusedBorder: OutlineInputBorder(
            
              borderSide: BorderSide(color: Colors.transparent),
              borderRadius: BorderRadius.circular(20)),
          hoverColor: Colors.transparent,
          fillColor: Colors.blueGrey[900],
          filled: true,
          suffixIconColor: Colors.black,
          // suffix: InkWell(
          //     onTap: onclick,
          //     child: Icon(
          //       icons,
          //       color: Colors.white,
          //     )),
          suffixIcon: InkWell(
            onTap: onclick,
            child: Icon(icons)),
          //  suffixIconConstraints: BoxConstraints(),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(color: Colors.green, width: 3)),
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.white)),
    );
  }
}
