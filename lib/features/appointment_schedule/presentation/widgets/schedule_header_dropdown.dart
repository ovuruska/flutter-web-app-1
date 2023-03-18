import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scrubbers_employee_application/features/appointment_schedule/domain/entities/dashboard_employee_entity.dart';
import 'package:scrubbers_employee_application/features/appointment_schedule/presentation/bloc/schedule_header_dropdown/schedule_header_dropdown_event.dart';

import '../../../../injection.dart';
import '../bloc/branch_schedule/appointment_schedule_bloc.dart';
import '../bloc/branch_schedule/appointment_schedule_state.dart';
import '../bloc/schedule_header_dropdown/schedule_header_dropdown_bloc.dart';
import '../bloc/schedule_header_dropdown/schedule_header_dropdown_state.dart';

class ScheduleHeaderDropdown extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppointmentScheduleBloc, AppointmentScheduleState>(
        bloc: sl<AppointmentScheduleBloc>(),
        builder: (event, state) {
          if (state is AppointmentScheduleStateLoaded) {
            List<DashboardEmployeeEntity> employees = state.employees;
            List<String> items = [
              'All Employees',
              'Full Grooming',
              'We Wash',
              ...employees.map((e) => e.name).toList()
            ];

            return BlocBuilder<ScheduleHeaderDropdownBloc,
                    ScheduleHeaderDropdownState>(
                bloc: sl<ScheduleHeaderDropdownBloc>(),
                builder: (event, dropdownState) {
                  var value = dropdownState.value;
                  // Check if selected employee is still in the list of employees
                  if (items.contains(value)) {
                    return DropdownButton<String>(
                        isExpanded: true,
                        value: value,
                        items:
                            items.map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          sl<ScheduleHeaderDropdownBloc>().add(
                              ScheduleHeaderDropdownSetEvent(
                                  newValue ?? 'All Employees'));
                        });
                  } else {
                    sl<ScheduleHeaderDropdownBloc>().add(
                        ScheduleHeaderDropdownSetEvent('All Employees'));
                    return Container();
                  }
                });
          }
          else{
            return Container();
          }
        });
  }
}
