import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' show WidgetbookUseCase;

import '../../../../widgets/cards/root/entity.dart';
import '../../domain/entities/dashboard_employee_entity.dart';
import '../widgets/appointment_schedule.dart';

final today = DateTime.now();

DateTime getTime(int hour, int minute) => DateTime(
    today.year,
    today.month,
    today.day,
    hour,
    minute,
);

@WidgetbookUseCase(name: 'Appointment Schedule', type:AppointmentSchedule)
Widget appointmentScheduleUseCase(BuildContext context){
  final employees = [
    DashboardEmployeeEntity(id: 1, name: 'John Doe',role:'We Wash'),
    DashboardEmployeeEntity(id: 2, name: 'Jane Doe',role:'We Wash'),
    DashboardEmployeeEntity(id: 3, name: 'John Smith',role:'Full Grooming'),
    DashboardEmployeeEntity(id: 4, name: 'Jane Smith',role:'Full Grooming'),


  ];

  final appointments = [
    DashboardAppointmentEntity(id: 1, status: "CheckedIn", customerName: "Cenk", employee: 2, service: "We Wash", breed: "D", dogName: "A", start: getTime(8,0), end: getTime(9,30), invoice: 30, specialHandling: true),
    DashboardAppointmentEntity(id: 2, status: "Confirmed", customerName: "Cenk", employee: 2, service: "We Wash", breed: "D", dogName: "A", start: getTime(9,30), end: getTime(11,0), invoice: 30, specialHandling: true),
    DashboardAppointmentEntity(id: 3, status: "Confirmed", customerName: "Cenk", employee: 1, service: "We Wash", breed: "D", dogName: "A", start: getTime(11,0), end: getTime(12,30), invoice: 30, specialHandling: true),
    DashboardAppointmentEntity(id: 4, status: "Confirmed", customerName: "Cenk", employee: 1, service: "We Wash", breed: "D", dogName: "A", start: getTime(12,30), end: getTime(14,0), invoice: 30, specialHandling: true),

  ];

  return AppointmentSchedule(
    date: today,
    branch: 1,
    appointments: appointments,
    employees: employees,
  );
}