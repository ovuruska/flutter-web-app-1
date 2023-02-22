import 'package:flutter/material.dart';

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
