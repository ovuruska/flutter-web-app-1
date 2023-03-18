import 'package:flutter/material.dart';

import 'percent_indicator.dart';

class DataCard extends StatelessWidget {
  final IconData icon;
  final String header;
  final String content;
  final int percent;

  const DataCard({Key? key, required this.icon, required this.header, required this.content, required this.percent}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height:120,
        width:240,
        child: Row(


      children: [
        Container(width:16),
        Container(
            height: 80,
            width:80,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                colors: [
                  const Color(0xFFD3E7FF),
                  const Color(0xFFEFFBFF)
                ],
                // no border

              ),
            ),
            child:Icon(icon, color: const Color(0xFF006EAC), size: 40,),
          ),
        Container(width:8),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(header,
                  style: TextStyle(
                    color: const Color(0xFFACACAC),
                    fontSize: 14,
                    fontFamily: "Poppins",
                  )),
              Text(content,
                  style: TextStyle(
                    color: const Color(0xFF333333),
                    fontSize: 32,
                    fontFamily: "Poppins",
                  )),
              PercentIndicator(percent: percent)
            ],
          ),
        )
      ],
    ));
  }
}
