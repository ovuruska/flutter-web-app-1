import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../domain/entities/monthly_appointment_costs.dart';

class ChartData {
  ChartData({
    required this.date,
    required this.tip,
    required this.weWash,
    required this.fullGrooming,
    required this.products,
  });

  final String date;
  final double tip;
  final double weWash;
  final double fullGrooming;
  final double products;
}

class StackedColumnChart extends StatelessWidget {
  final Map<String, MonthlyAppointmentCosts> data;

  const StackedColumnChart({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var chartData = data.entries
        .map((e) => ChartData(
            date: e.key,
            tip: e.value.tip,
            weWash: e.value.weWash,
            fullGrooming: e.value.fullGrooming,
            products: e.value.products))
        .toList();

    return SfCartesianChart(primaryXAxis: CategoryAxis(), series: <ChartSeries>[
      StackedColumnSeries<ChartData, String>(
          dataSource: chartData,
          xValueMapper: (ChartData data, _) => data.date,
          yValueMapper: (ChartData data, _) => data.fullGrooming),
      StackedColumnSeries<ChartData, String>(
          dataSource: chartData,
          xValueMapper: (ChartData data, _) => data.date,
          yValueMapper: (ChartData data, _) => data.weWash),
      StackedColumnSeries<ChartData, String>(
          dataSource: chartData,
          xValueMapper: (ChartData data, _) => data.date,
          yValueMapper: (ChartData data, _) => data.tip),
      StackedColumnSeries<ChartData, String>(
          dataSource: chartData,
          xValueMapper: (ChartData data, _) => data.date,
          yValueMapper: (ChartData data, _) => data.products)
    ]);
  }
}
