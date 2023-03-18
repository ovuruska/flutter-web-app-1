import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' show WidgetbookUseCase;

import '../widgets/data_card_2.dart';


@WidgetbookUseCase(type: DataCard2, name: 'Data Card 2 positive')
Widget dataCard2PositiveUseCase(BuildContext context){
  return DataCard2(
    header: "Total Appointments",
    content: "13",
    percent: 16,
  );
}

@WidgetbookUseCase(type: DataCard2, name: 'Data Card 2 negative')
Widget dataCard2NegativeUseCase(BuildContext context){
  return DataCard2(
    header: "Average Ticket Price",
    content: "\$95",
    percent: -16,
  );
}

@WidgetbookUseCase(type: DataCard2, name: 'Data Card zero')
Widget dataCard2ZeroUseCase(BuildContext context){
  return DataCard2(
    header: "Lifetime Value",
    content: "12",
    percent: 0,
  );
}
