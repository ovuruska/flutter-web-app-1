import 'package:flutter/material.dart';

Widget getStyledButton({void Function()? onPressed,bool disabled = false, required String text,double width = 160,double fontSize=16}) =>
    Container(

        width: width,
        height:24,
        child: ElevatedButton(onPressed:(disabled) ? null : onPressed,style:ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
        ), child: Text(text,style:TextStyle(color: Colors.black,fontSize: fontSize,fontWeight: FontWeight.bold),)));



String prettyPrintPets(List<String> data) {
  if (data.length == 0) {
    return "N/A";
  } else if (data.length == 1) {
    return data[0];
  } else {
    return data.sublist(0, data.length - 1).join(", ") + " and " + data.last;
  }
}