import 'package:flutter/material.dart';
import 'appointment_context.dart';

class AppointmentContextProvider extends InheritedWidget {

  final AppointmentContext appointmentContext;


  AppointmentContextProvider({required Widget child,required this.appointmentContext}) : super(child: child);

  static AppointmentContext of(BuildContext context) {
    final AppointmentContextProvider? result =
    context.dependOnInheritedWidgetOfExactType<AppointmentContextProvider>();
    if (result == null) {
      throw FlutterError('No AppointmentContextProvider is found in the widget tree');
    }
    return result.appointmentContext;
  }

  @override
  bool updateShouldNotify(AppointmentContextProvider oldWidget) {
    return appointmentContext != oldWidget.appointmentContext;
  }
}

