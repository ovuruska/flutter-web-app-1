import 'package:flutter/material.dart';
import 'package:scrubbers_employee_application/features/appointment_schedule/domain/repositories/dashboard_appointment_entity.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' show WidgetbookUseCase;

import '../widgets/daily_calendar.dart';

@WidgetbookUseCase(
  name: 'Daily Calendar',
  type: DailyCalendar,
)
dailyCalendarUseCase(BuildContext context){
  /// List with 5 random DashboardAppointmentEntity
  /// DashboardAppointmentEntity(id: id, customerName: customerName, employee: employee, service: service, breed: breed, dogName: dogName, start: start, end: end, invoice: invoice)

  final appointments = List.generate(5, (index) => DashboardAppointmentEntity(
    id: index,
    customerName: 'customerName',
    employee: index,
    service: 'service',
    breed: 'breed',
    dogName: 'dogName',
    start: DateTime.now(),
    end: DateTime.now(),
    invoice: 0.0, specialHandling: true,
  ));

  /// Employee name
  final employeeName = 'employeeName';

  /// Employee id
  final employeeId = 1;


  return DailyCalendar(
    start:10,
    end:18,
    appointments: appointments,
    employeeName: employeeName,
    employeeId: employeeId,
  );
}