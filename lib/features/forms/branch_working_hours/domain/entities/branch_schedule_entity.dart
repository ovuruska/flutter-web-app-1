import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BranchScheduleEntity extends Equatable {
  final TimeOfDay? start;
  final TimeOfDay? end;
  final DateTime date;
  final int? branch;

  BranchScheduleEntity({
    this.start,
    this.end,
    required this.date,
    this.branch,
  });

  @override
  List<Object?> get props => [start, end, date, branch];

  @override
  toString() =>
      'DailyScheduleEntity(start: $start, end: $end, date: $date, branch: $branch)';

  factory BranchScheduleEntity.fromJson(Map<String, dynamic> json) {
    return BranchScheduleEntity(
      branch: json['id'] as int,
      date: DateTime.parse(json['date'] as String),
      start: TimeOfDay(
          hour: json['start']['hour'] as int,
          minute: json['start']['minute'] as int),
      end: TimeOfDay(
          hour: json['end']['hour'] as int,
          minute: json['end']['minute'] as int),
    );
  }

  Map<String, dynamic> toJson() {
    var dateFormatter = new DateFormat('yyyy-MM-dd');
    var timeFormatter = new DateFormat('yyyy-MM-dd HH:mm');
    return {
      'branch': branch,
      'date': dateFormatter.format(date),
      'start': timeFormatter.format(DateTime(date.year, date.month, date.day,
          start?.hour ?? 0, start?.minute ?? 0)),
      'end': timeFormatter.format(DateTime(
          date.year, date.month, date.day, end?.hour ?? 0, end?.minute ?? 0)),
    };
  }
}
