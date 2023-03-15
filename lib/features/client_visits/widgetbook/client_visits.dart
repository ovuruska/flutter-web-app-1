import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' show WidgetbookUseCase;

import '../presentation/widgets/client_visits.dart';

@WidgetbookUseCase(name: 'ClientVisits', type:ClientVisits)
Widget clientVisitsUseCase(BuildContext context){
  Map<String, double> data = {
    "We Wash": 10,
    "Full Grooming": 5,
  };

  return Container(
    color: Colors.white,
      height:144,
      width:96,
      child:ClientVisits(data: data)
  );
}