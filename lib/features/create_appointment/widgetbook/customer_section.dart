


import 'package:card_settings/card_settings.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

import '../presentation/widgets/customer_section.dart';

@WidgetbookUseCase(name: 'Customer Section', type: CardSettingsSection)
Widget customerSectionUseCase(BuildContext context) {
  return customerSection();
}