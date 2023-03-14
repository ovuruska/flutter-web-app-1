import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class TopCategoryChart extends StatelessWidget{

  final Map<String, double> data;

  const TopCategoryChart({Key? key, required this.data}) : super(key: key);

  final weWash= const Color(0xFF90D7FF);
  final grooming = const Color(0xFF2D7CB6);
  final tips = const Color(0xFF47BDFF);
  final addOns = const Color(0xFF0F2A3D);

  @override
  Widget build(BuildContext context) {
    return PieChart(
      colorList: [weWash, grooming, tips, addOns],
      formatChartValues: (value) {
        return "\$" + value.toStringAsFixed(0) ;
      },
      dataMap: data,
        chartLegendSpacing:16
    );
  }

}