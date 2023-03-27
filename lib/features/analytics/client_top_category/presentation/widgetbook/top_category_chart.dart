import 'package:flutter/cupertino.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' show WidgetbookUseCase;

import '../widgets/top_category_chart.dart';

@WidgetbookUseCase(name: "Top category pie chart", type: TopCategoryChart)
Widget topCategoryUseCase(BuildContext context){

  Map<String, double> data = {
    "Flutter": 5,
    "React": 3,
    "Xamarin": 2,
    "Ionic": 2,
  };
  return TopCategoryChart(data: data);
}