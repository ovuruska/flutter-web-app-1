import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

final boldCell = (String text) => DataCell(Text(
  text,
  style: TextStyle(
    fontSize: 16,
    color: Colors.black,
    fontWeight: FontWeight.bold,
  ),
));
final normalCell = (String text) => DataCell(Text(
  text,
  style: TextStyle(
    fontSize: 16,
    color: Colors.black,
  ),
));

Widget divider({Color? color}) => VerticalDivider(thickness: 2, color: color ?? Colors.black);

String formatDate(DateTime date) {
  //"Mon - 26 Feb 2023" | "4.00pm"
  var dateString = DateFormat("EEE - d MMM yyyy").format(date);
  return dateString;
}
