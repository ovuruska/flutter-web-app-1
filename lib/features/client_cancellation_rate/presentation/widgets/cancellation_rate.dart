

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CancellationRate extends StatelessWidget {
  final double cancellationRate;
  const CancellationRate({Key? key, required this.cancellationRate}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:Container(
          height:double.infinity,
          width:double.infinity,
          padding: EdgeInsets.all(4),
      decoration: BoxDecoration(
        border: Border.all(
          color:  const Color(0xFFE4E4E7),
        ),borderRadius: BorderRadius.circular(8.0)
        ),
        child:Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text("CANCELLATION",style:GoogleFonts.plusJakartaSans(
          textStyle: TextStyle(
            fontSize: 12,
            color:const Color(0xFF71717A),
          )
        )),
        Text("${cancellationRate.toStringAsFixed(0)}%",style:GoogleFonts.plusJakartaSans(
          textStyle: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color:const Color(0xFF18181B),
          )
        )),
      ],
    )));
  }
}