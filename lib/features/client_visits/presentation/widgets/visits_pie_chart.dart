
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';



class VisitsPieChart extends StatelessWidget {
  final Map<String,double> data;
  final double? radius;

  const VisitsPieChart({Key? key, required this.data, this.radius}) : super(key: key);
  final weWash= const Color(0xFF90D7FF);
  final grooming = const Color(0xFF2D7CB6);

  @override
  Widget build(BuildContext context) {
    return PieChart(
      chartRadius: radius,
      chartValuesOptions: ChartValuesOptions(
        showChartValues: false,
      ),
      ringStrokeWidth: 12,
      chartLegendSpacing: 0,
      chartType: ChartType.ring,
        degreeOptions: DegreeOptions(
          totalDegrees: 180,
          initialAngle: 180,
        ),
        legendOptions: LegendOptions(
          showLegends: false,
          legendPosition: LegendPosition.bottom,
        ),
        colorList: [weWash, grooming],
        dataMap: data

    );
  }
}