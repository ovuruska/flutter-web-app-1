

import 'package:flutter/material.dart';

class PercentIndicator extends StatelessWidget {
  final int percent;

  const PercentIndicator({Key? key, required this.percent}) : super(key: key);

  _icon(int percent) {
    if(percent < 0){
return Icon(Icons.arrow_downward,color: Colors.redAccent);
    } else if(percent > 0){
      return Icon(Icons.arrow_upward,color:const Color(0xFF006EAC));
    } else {
      return Icon(Icons.arrow_back_sharp,color: Colors.amberAccent,);
    }
  }

  _text(int percent) {
    if(percent < 0){
      return Text('$percent%',style: TextStyle(color: Colors.redAccent),);
    } else if(percent > 0){
      return Text('$percent%',style: TextStyle(color:const Color(0xFF006EAC)),);
    } else {
      return Text('$percent%',style: TextStyle(color: Colors.amberAccent),);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _icon(percent),
        _text(percent),
        Text(" this month",style:TextStyle(
          color:const Color(0xFF292D32),
          fontSize: 12,
          fontFamily: "Poppins",
        ))

      ],
    );
  }



}