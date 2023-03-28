
import 'package:flutter/material.dart';

Widget getText({required String text,Color ? color}) => Text(text,
    style: TextStyle(
        color: color ?? Colors.black, fontSize: 16, fontWeight: FontWeight.bold));