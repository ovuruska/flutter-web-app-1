import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scrubbers_employee_application/features/client_top_category/presentation/widgets/top_category_chart.dart';

class ClientTopCategory extends StatelessWidget {
  final Map<String, double> data;

  const ClientTopCategory({Key? key, required this.data}) : super(key: key);

  Text _header(String header) => Text(header,
      style: GoogleFonts.plusJakartaSans(
        textStyle: TextStyle(
          fontSize: 16,
          color: const Color(0xFF71717A),
          fontWeight: FontWeight.w600,
        ),
      ));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(padding: EdgeInsets.all(16), child: _header("Top Category")),
        Expanded(
          child:TopCategoryChart(data: data),
        )
      ],
    ));
  }
}
