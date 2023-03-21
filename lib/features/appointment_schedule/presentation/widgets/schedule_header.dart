import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:scrubbers_employee_application/common/get_it_maybe.dart';
import 'package:scrubbers_employee_application/features/app_select_branch/domain/entities/branch_id_and_name.dart';
import 'package:scrubbers_employee_application/features/app_select_branch/presentation/bloc/app_select_branch_bloc.dart';
import 'package:scrubbers_employee_application/features/app_select_branch/presentation/bloc/app_select_branch_state.dart';
import 'package:scrubbers_employee_application/features/appointment_schedule/presentation/widgets/schedule_header_dropdown.dart';

import '../../../../injection.dart';
import '../../domain/callbacks/appointment_header_set_date.dart';
import '../../domain/callbacks/schedule_header_week_changed.dart';
import '../bloc/schedule_header/schedule_header_bloc.dart';
import '../bloc/schedule_header/schedule_header_event.dart';

class ScheduleHeader extends StatelessWidget {
  final DateTime date;
  final BranchIdAndName? branch;

  final DateFormat _dateFormat = DateFormat('d MMMM yyyy');

  ScheduleHeader({Key? key, required this.date, this.branch}) : super(key: key);

  void setDate(DateTime date) {
    sl<AppointmentScheduleHeaderBloc>()
        .add(AppointmentScheduleHeaderEventSetDate(date: date));
    getItMaybe<AppointmentHeaderSetDateCallback>()?.call(date);
  }

  void weekChanged(DateTime date) {
    getItMaybe<ScheduleHeaderWeekChangedCallback>()?.call(date);
  }

  String getBranchName() {
      if (branch == null) {
        return '';
      }
      return branch!.name;
  }

  void _onPrevious() {
    var previousDay = date.subtract(Duration(days: 1));
    if (previousDay.day == 1) {
      weekChanged(previousDay);
    }
    setDate(previousDay);
  }

  void _onNext() {
    var nextDay = date.add(Duration(days: 1));
    if (nextDay.day == 1) {
      weekChanged(nextDay);
    }

    setDate(nextDay);
  }

  void _onToday() {
    setDate(DateTime.now());
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            TextButton(
              onPressed: _onToday,
              child: Text('Today'),
            ),
            Container(width: 16),
            Container(
              width: 160,
              child: ScheduleHeaderDropdown(),
            ),
            Container(width: 16),
          ],
        ),
        Row(
          children: [
            Tooltip(
              message:
                  'Go to ${_dateFormat.format(DateTime.now().subtract(Duration(days: 1)))}',
              child: IconButton(
                onPressed: _onPrevious,
                icon: Icon(Icons.chevron_left),
              ),
            ),
            Container(
              width: 32,
            ),
            Text(
              _dateFormat.format(date),
              style: TextStyle(fontSize: 18),
            ),
            Container(
              width: 32,
            ),
            Tooltip(
              message:
                  'Go to ${_dateFormat.format(DateTime.now().add(Duration(days: 1)))}',
              child: IconButton(
                onPressed: _onNext,
                icon: Icon(Icons.chevron_right),
              ),
            ),
          ],
        ),
        Container(
            width:240,
            child: Text(getBranchName(),textAlign: TextAlign.right,)),
      ],
    );
  }
}
