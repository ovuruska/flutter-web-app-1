import 'package:card_settings/card_settings.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' show WidgetbookUseCase;

import '../domain/entities/branch_entity.dart';
import '../presentation/widgets/appointment_section.dart';

@WidgetbookUseCase(name: 'Customer Section', type: CardSettingsSection)
Widget appointmentSectionUseCase(BuildContext context) {

  return appointmentSection();
}