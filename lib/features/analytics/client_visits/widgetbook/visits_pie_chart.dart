import 'package:flutter/cupertino.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' show WidgetbookUseCase;

import '../presentation/widgets/visits_pie_chart.dart';

@WidgetbookUseCase(name:"Visits pie chart",type:VisitsPieChart)
Widget visitsPieChartUseCase(BuildContext context){
  Map<String,double> data = {
    "WeWash": 5,
    "Grooming": 8,
  };
  return VisitsPieChart(data: data);
}