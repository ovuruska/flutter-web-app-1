import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ClientVisits extends StatelessWidget {
  final Map<String, double> data;

  const ClientVisits({Key? key, required this.data}) : super(key: key);

  int get totalVisits =>
      data.values.reduce((value, element) => value + element).toInt();

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      var maxHeight = constraints.maxHeight;
      var maxWidth = constraints.maxWidth;
      return Container(
          padding: EdgeInsets.all(4),
          height: maxHeight,
          width: maxWidth,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: const Color(0xFFE5E5EA)),
          ),
          child: Stack(children: [
            Positioned.fill(
                child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("VISITS",
                    style: GoogleFonts.plusJakartaSans(
                        textStyle: TextStyle(
                      fontSize: 12,
                      color: const Color(0xFF71717A),
                    ))),
                Text("$totalVisits",
                    style: GoogleFonts.plusJakartaSans(
                        textStyle: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: const Color(0xFF18181B),
                    ))),
              ],
            )),

          ]));
    }));
  }
}
