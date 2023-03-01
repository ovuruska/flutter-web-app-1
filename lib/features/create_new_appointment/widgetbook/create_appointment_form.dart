import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';
import '../presentation/widgets/create_appointment_form.dart';

@WidgetbookUseCase(name: 'Create appointment form', type:CreateAppointmentForm)
Widget createAppointmentFormUseCase(BuildContext context) {
  return CreateAppointmentForm();
}