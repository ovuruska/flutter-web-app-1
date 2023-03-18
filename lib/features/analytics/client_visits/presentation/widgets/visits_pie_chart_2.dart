import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class VisitsPieChart2Data {
  final String x;
  final double y;

  VisitsPieChart2Data(this.x, this.y);
}

class VisitsPieChart2 extends StatelessWidget {
  final Map<String, double> data;
  final TooltipBehavior _tooltip = TooltipBehavior(enable: true);

  VisitsPieChart2({Key? key, required this.data}) : super(key: key);

  List<VisitsPieChart2Data> get _data =>
      data.entries.map((e) => VisitsPieChart2Data(e.key, e.value)).toList();

  @override
  Widget build(BuildContext context) {
    return SfCircularChart(tooltipBehavior: _tooltip, series: <CircularSeries>[
      DoughnutSeries<VisitsPieChart2Data, String>(
        dataSource: _data,
        xValueMapper: (VisitsPieChart2Data data, _) => data.x,
        yValueMapper: (VisitsPieChart2Data data, _) => data.y,
        dataLabelSettings: DataLabelSettings(isVisible: true),
        pointColorMapper: (VisitsPieChart2Data data, _) => data.x == "WeWash"
            ? const Color(0xFF90D7FF)
            : const Color(0xFF2D7CB6),
      )
    ]);
  }
}
