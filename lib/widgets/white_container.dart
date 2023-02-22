

import 'package:flutter/material.dart';

class WhiteContainer extends StatelessWidget {

  final Widget child;
  final EdgeInsetsGeometry? padding;

  const WhiteContainer({Key? key, required this.child,this.padding}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: child,
    );
  }

}