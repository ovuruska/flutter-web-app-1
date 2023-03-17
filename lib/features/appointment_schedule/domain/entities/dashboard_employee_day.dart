import 'package:equatable/equatable.dart';

class DashboardEmployeeDay extends Equatable {
  final int id;
  final String name;
  final String role;
  final DateTime date;
  final DateTime? start;
  final DateTime? end;

  DashboardEmployeeDay({
    required this.id,
    required this.name,
    required this.role,
    required this.date,
    this.start,
    this.end,
  });

  @override
  List<Object?> get props => [id, name, role];

  factory DashboardEmployeeDay.fromJson(Map<String, dynamic> json) {
    return DashboardEmployeeDay(
      id: json['id'],
      name: json['name'],
      role: json['role'],
      date: DateTime.parse(json['date']),
      start: json['start'] != null ? DateTime.parse(json['start']) : null,
      end: json['end'] != null ? DateTime.parse(json['end']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'role': role,
      'date': date,
      'start': start?.toIso8601String(),
      'end': end?.toIso8601String(),
    };
  }
}