import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' show WidgetbookUseCase;

import '../widgets/data_card.dart';

@WidgetbookUseCase(type: DataCard, name: 'Data Card positive')
Widget dataCardPositiveUseCase(BuildContext context){
  return DataCard(
    icon: Icons.access_alarm,
    header: "Total Appointments",
    content: "13",
    percent: 16,
  );
}

@WidgetbookUseCase(type: DataCard, name: 'Data Card negative')
Widget dataCardNegativeUseCase(BuildContext context){
  return DataCard(
    icon: Icons.access_alarm,
    header: "Average Ticket Price",
    content: "\$95",
    percent: -16,
  );
}

@WidgetbookUseCase(type: DataCard, name: 'Data Card zero')
Widget dataCardZeroUseCase(BuildContext context){
  return DataCard(
    icon: Icons.access_alarm,
    header: "Lifetime Value",
    content: "12",
    percent: 0,
  );
}
