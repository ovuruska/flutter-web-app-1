import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' show WidgetbookUseCase;

import '../../../../widgets/cards/root/entity.dart';
import '../widgets/daily_calendar.dart';

@WidgetbookUseCase(
  name: 'Daily Calendar',
  type: DailyCalendar,
)
dailyCalendarUseCase(BuildContext context){
  /// List with 5 random DashboardAppointmentEntity
  /// DashboardAppointmentEntity(id: id, customerName: customerName, employee: employee, service: service, breed: breed, dogName: dogName, start: start, end: end, invoice: invoice)
  final allStatuses = [
    'Confirmed',
    'CheckedIn',
    'Completed',
    'Cancelled',
    'Pending',
  ];
  var date = DateTime(2021, 9, 1, 10, 0);
  final startEndPair = [
      [DateTime(2021, 9, 1, 10, 0), DateTime(2021, 9, 1, 11, 0)],
      [DateTime(2021, 9, 1, 11, 0), DateTime(2021, 9, 1, 12, 0)],
      [DateTime(2021, 9, 1, 12, 0), DateTime(2021, 9, 1, 13, 0)],
      [DateTime(2021, 9, 1, 13, 0), DateTime(2021, 9, 1, 14, 0)],
      [DateTime(2021, 9, 1, 14, 0), DateTime(2021, 9, 1, 15, 0)],

  ];

  final appointments = List.generate(5, (index) => DashboardAppointmentEntity(
    id: index,
    customerName: 'customerName',
    employee: index,
    service: 'service',
    breed: 'breed',
    dogName: 'dogName',
    employeeName: 'Jane Doe',
    start: startEndPair[index][0],
    end: startEndPair[index][1],
    invoice: 0.0, specialHandling: true, status: allStatuses[index],
  ));

  /// Employee name
  final employeeName = 'employeeName';

  /// Employee id
  final employeeId = 1;


  return DailyCalendar(
    date: date,
    start:10,
    end:18,
    appointments: appointments,
    header: employeeName,
    employeeId: employeeId,
  );
}