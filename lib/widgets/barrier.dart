import 'package:flutter/material.dart';

class Barrier extends StatelessWidget {

  final Widget child;
  final String fallbackRoute;


  const Barrier({Key? key,  required this.child, required this.fallbackRoute}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return child;
  }

}