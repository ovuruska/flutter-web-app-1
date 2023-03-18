import 'package:equatable/equatable.dart';

import 'appointments_table_data_row_entity.dart';


class PaginatedAppointments extends Equatable {
  final List<AppointmentsTableDataRowEntity> results;
  final int count;
  final String? previous;
  final String? next;


  PaginatedAppointments({
    required this.results,
    required this.count,
    this.previous,
    this.next,
  });

  @override
  List<Object?> get props => [
    results,
    count,
    previous,
    next,
  ];

  factory PaginatedAppointments.fromJson(Map<String, dynamic> json) {
    return PaginatedAppointments(
      results: json['results'].map<AppointmentsTableDataRowEntity>((e) => AppointmentsTableDataRowEntity.fromJson(e)).toList(),
      count: json['count'],
      previous: json['previous'],
      next: json['next'],
    );
  }

}