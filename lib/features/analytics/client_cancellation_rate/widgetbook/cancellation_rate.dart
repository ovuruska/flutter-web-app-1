import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' show WidgetbookUseCase;

import '../presentation/widgets/cancellation_rate.dart';


@WidgetbookUseCase(name: 'Client Cancellation Rate', type: CancellationRate)
Widget cancellationRateUseCase(BuildContext context) {
  return CancellationRate(rate: 0.0);
}