import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:scrubbers_employee_application/common/DateUtils.dart';
import 'package:scrubbers_employee_application/common/time_of_day.dart';

import 'branch_entity.dart';

class BranchWorkingHours extends Equatable {
  final TimeOfDay? start;
  final TimeOfDay? end;
  final DateTime date;
  final BranchEntity? branch;

  BranchWorkingHours(
      {
        required this.start,
        required this.end,
        required this.branch,
        required this.date});

  @override
  List<Object?> get props => [ start, end, branch];

  factory BranchWorkingHours.fromJson(Map<String, dynamic> json) {
    // 18:00:00
    var start = json['start'] != null ? TimeOfDayExtension.fromString(json['start']) : null;
    var end = json['end'] != null ? TimeOfDayExtension.fromString(json['end']) : null;
    var date = DateTime.parse(json['date']);

    return BranchWorkingHours(
      start: start,
      end: end,
      branch: BranchEntity.fromJson(json['branch']),
      date: date,
    );
  }

  Map<String, dynamic> toJson() {

    var start = this.start != null ? date.startOfDay.add(Duration(hours: this.start!.hour, minutes: this.start!.minute)) : null;
    var end = this.end != null ? date.startOfDay.add(Duration(hours: this.end!.hour, minutes: this.end!.minute)) : null;

    return {
      'start': start?.toUtc().toString(),
      'end': end?.toUtc().toString(),
      'branch': branch,
      'date': date.toString(),
    };
  }
}
