import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:scrubbers_employee_application/common/get_it_maybe.dart';

import '../../../../injection.dart';
import '../../domain/callbacks/appointment_header_set_date.dart';
import '../bloc/schedule_header/schedule_header_bloc.dart';
import '../bloc/schedule_header/schedule_header_event.dart';

class ScheduleHeader extends StatelessWidget {
  final DateTime date;

  final DateFormat _dateFormat = DateFormat('d MMMM yyyy');

  ScheduleHeader({Key? key, required this.date}) : super(key: key);

  void setDate(DateTime date) {
    sl<AppointmentScheduleHeaderBloc>().add(ScheduleHeaderSetDateEvent(date: date));
    getItMaybe<AppointmentHeaderSetDateCallback>()?.call(date);
  }

  void _onPrevious() {
    var previousDay = date.subtract(Duration(days: 1));
    setDate(previousDay);
  }

  void _onNext() {
    var nextDay = date.add(Duration(days: 1));
    setDate(nextDay);
  }

  void _onToday() {
    setDate(DateTime.now());
  }

  void _onAdd() {
    // Handle add icon button click
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
            DropdownButton<String>(
              value: 'All Employees',
              items: <String>['All Employees', 'Employee 1', 'Employee 2']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue) {
                // Handle employee dropdown selection
              },
            ),
            Container(width: 16),

            DropdownButton<String>(
              value: 'Filter',
              items: <String>['Filter', 'Option 1', 'Option 2']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue) {
                // Handle filter dropdown selection
              },
            ),
          ],
        ),
        Row(
          children: [
            IconButton(
              onPressed: _onPrevious,
              icon: Icon(Icons.chevron_left),
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
            IconButton(
              onPressed: _onNext,
              icon: Icon(Icons.chevron_right),
            ),
          ],
        ),
        IconButton(
          onPressed: _onAdd,
          icon: Icon(Icons.add),
        ),
      ],
    );
  }
}
