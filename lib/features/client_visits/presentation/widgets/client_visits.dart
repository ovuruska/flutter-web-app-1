import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scrubbers_employee_application/features/client_visits/presentation/widgets/visits_pie_chart.dart';

class ClientVisits extends StatelessWidget {
  final Map<String, double> data;

  const ClientVisits({Key? key, required this.data}) : super(key: key);

  int get totalVisits =>
      data.values.reduce((value, element) => value + element).toInt();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: const Color(0xFFE5E5EA)),
          ),
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
          VisitsPieChart(data: data)
            ],
          )),
    );
  }
}
