import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' show WidgetbookUseCase;

import '../presentation/widgets/no_show_rate.dart';


@WidgetbookUseCase(name: 'Client No Show Rate', type: NoShowRate)
Widget noShowRateUseCase(BuildContext context) {
  return NoShowRate(rate: 0.0);
}