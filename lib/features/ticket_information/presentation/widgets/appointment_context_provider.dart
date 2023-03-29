import 'package:flutter/material.dart';
import 'package:scrubbers_employee_application/core/domain/entities/appointment.dart';
import 'appointment_context.dart';

class AppointmentContextProvider extends InheritedNotifier<AppointmentContext> {
  final AppointmentEntity appointment;

  AppointmentContextProvider({
    Key? key,
    required Widget child,
    required this.appointment,
  }) : super(
            key: key,
            child: child,
            notifier: AppointmentContext(appointment: appointment));

  static AppointmentContextProvider of(BuildContext context) {
    AppointmentContextProvider? result = context
        .dependOnInheritedWidgetOfExactType<AppointmentContextProvider>();
    if (result == null) {
      throw FlutterError(
          'No AppointmentContextProvider is found in the widget tree');
    }
    return result;
  }
}
