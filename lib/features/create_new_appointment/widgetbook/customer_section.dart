


import 'package:card_settings/card_settings.dart';
import 'package:flutter/material.dart';
import 'package:scrubbers_employee_application/features/create_new_appointment/presentation/widgets/customer_section.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

@WidgetbookUseCase(name: 'Customer Section', type: CardSettingsSection)
Widget customerSectionUseCase(BuildContext context) {
  return customerSection();
}