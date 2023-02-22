import 'package:flutter/material.dart';

class CardDivider extends StatelessWidget {
  final Color? color;
  const CardDivider({Key? key, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VerticalDivider(thickness: 2, color: color ?? Colors.black);
  }
}
