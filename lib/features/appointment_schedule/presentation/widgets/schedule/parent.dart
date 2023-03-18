import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scrubbers_employee_application/features/appointment_schedule/domain/entities/dashboard_employee_entity.dart';
import 'package:scrubbers_employee_application/features/appointment_schedule/presentation/widgets/schedule/employee_weekly_schedule.dart';

import '../../../../../injection.dart';
import '../../../../../widgets/cards/root/entity.dart';
import '../../../utils/constants.dart';
import '../../bloc/schedule_header_dropdown/schedule_header_dropdown_bloc.dart';
import '../../bloc/schedule_header_dropdown/schedule_header_dropdown_state.dart';
import 'appointment_schedule.dart';



class AppointmentScheduleParent extends StatelessWidget {
  final List<DashboardEmployeeEntity> employees;
  final List<DashboardAppointmentEntity> appointments;
  final DateTime date;
  final int? branch;

  const AppointmentScheduleParent(
      {Key? key,
      required this.employees,
      required this.appointments,
      required this.date,
      this.branch})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ScheduleHeaderDropdownBloc, ScheduleHeaderDropdownState>(
        bloc: sl<ScheduleHeaderDropdownBloc>(),
        builder: (context, state) {
          var value = state.value;
          // Check if selected employee is still in the list of employees
          if (value == 'All Employees') {
            return AppointmentSchedule(
                employees: employees,
                branch: branch,
                date: date,
                appointments: appointments);
          }
          if (nonEmployeeTabs.contains(value)) {
            return AppointmentSchedule(
              employees:
                  employees.where((element) => element.role == value).toList(),
              appointments: appointments,
              date: date,
              branch: branch,
            );
          } else {
            var employee = employees.firstWhere((element) => element.name == value);
            return EmployeeWeeklySchedule(date: date, employee: employee, appointments: appointments);
          }
        });
  }
}
