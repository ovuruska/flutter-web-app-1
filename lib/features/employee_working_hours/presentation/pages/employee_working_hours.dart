import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../injection.dart';
import '../../domain/entities/daily_schedule_entity.dart';
import '../bloc/working_hours_bloc.dart';
import '../bloc/working_hours_event.dart';
import '../bloc/working_hours_state.dart';
import '../widgets/weekly_schedule.dart';

class EmployeeWorkingHoursView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _EmployeeWorkingHoursViewState();
}

class _EmployeeWorkingHoursViewState extends State<EmployeeWorkingHoursView> {

  Widget _container(List<DailyScheduleEntity> workingHours,int employee) => Container(
      margin: EdgeInsets.all(8),
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(.5),
        borderRadius: BorderRadius.circular(8),
      ),
      child: WeeklyScheduleWidget(
        key: Key(DateTime.now().toString()),
        initialValue: workingHours,
        employee: employee,
        onClear: () {
          sl<EmployeeWorkingHoursBloc>().add(
            ClearWorkingHoursEvent(
              id: employee,
            ),
          );
        },
        onSaved: (workingHours) {
          sl<EmployeeWorkingHoursBloc>().add(
            UpsertWorkingHoursEvent(
              id: employee,
              workingHours: workingHours,
            ),
          );
        },
      ));

  @override
  Widget build(BuildContext context) {
    return Container(
      child: BlocBuilder<EmployeeWorkingHoursBloc, EmployeeWorkingHoursState>(
        bloc: sl<EmployeeWorkingHoursBloc>(),
        builder: (context, state) {
          if (state is Loading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is Loaded ) {
            var workingHours = state.workingHours;
            var employee = state.id;
            return _container(workingHours, employee);
          } else if (state is Failed) {
            return Center(
              child: Text(state.message),
            );
          } else if(state is Initial){
            var workingHours = WeeklyScheduleWidget.empty();
            var employeeId = state.id;
            return _container(workingHours, employeeId);
          }
          else {
            return Container(
            );
          }
        },
      ),
    );
  }
}
