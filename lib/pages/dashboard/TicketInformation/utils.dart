import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:scrubbers_employee_application/common/shadow.dart';

String formatDate(DateTime date) {
  //"Mon - 26 Feb 2023" | "4.00pm"
  var dateString = DateFormat("EEE - d MMM yyyy").format(date);
  return dateString;
}

Widget getStyledButton({void Function()? onPressed, required String text,double width = 160,double fontSize=16}) =>
    ShadowContainer(
  child:
    Container(

        width: width,
        height:24,
        child: ElevatedButton(onPressed: onPressed,style:ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
        ), child: Text(text,style:TextStyle(color: Colors.black,fontSize: fontSize,fontWeight: FontWeight.bold),))));


String prettyPrintPets(List<String> data) {
  if (data.length == 0) {
    return "N/A";
  } else if (data.length == 1) {
    return data[0];
  } else {
    return data.sublist(0, data.length - 1).join(", ") + " and " + data.last;
  }
}

Widget divider({Color? color}) => VerticalDivider(thickness: 2, color: color ?? Colors.black);