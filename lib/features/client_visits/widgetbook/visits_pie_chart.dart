import 'package:flutter/cupertino.dart';
import 'package:scrubbers_employee_application/features/client_visits/presentation/widgets/visits_pie_chart.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' show WidgetbookUseCase;

@WidgetbookUseCase(name:"Visits pie chart",type:VisitsPieChart)
Widget visitsPieChartUseCase(BuildContext context){
  Map<String,double> data = {
    "WeWash": 5,
    "Grooming": 8,
  };
  return VisitsPieChart(data: data);
}