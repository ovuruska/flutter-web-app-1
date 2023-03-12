

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppHeaderNavButton extends StatelessWidget {

  final String text;
  final String route;
  final bool selected;

  const AppHeaderNavButton({Key? key, required this.text, required this.route, this.selected = false}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child:GestureDetector(
        onTap:(){
          if(!selected) context.pushNamed(route);
        },
          child:Container(
        margin: EdgeInsets.symmetric(horizontal: 8 ),
        child: Text(
          text,
          style: TextStyle(
            color: const Color(0xFF252C32),
            fontSize: 14,
            fontWeight: (selected) ? FontWeight.w900 : FontWeight.w500,
          ),
        ),
      ))
    );
  }

}