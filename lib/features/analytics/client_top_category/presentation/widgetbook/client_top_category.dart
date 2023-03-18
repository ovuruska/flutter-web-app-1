import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart'
    show WidgetbookUseCase;

import '../widgets/client_top_category.dart';

@WidgetbookUseCase(name: "Top category pie chart", type: ClientTopCategory)
Widget clientTopCategoryUseCase(BuildContext context) {
  Map<String, double> data = {
    "Flutter": 5,
    "React": 3,
    "Xamarin": 2,
    "Ionic": 2,
  };
  return Container(
      color: Colors.white,
      width: 320,
      height: 240,
      child: ClientTopCategory(data: data));
}
