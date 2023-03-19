import 'package:equatable/equatable.dart';

class SchedulingEmployeeEntity extends Equatable {
  final int id;
  final String name;
  final String role;
  final DateTime? start;
  final DateTime? end;

  SchedulingEmployeeEntity({
    required this.id,
    required this.name,
    required this.role,
    this.start,
    this.end,
  });

  @override
  List<Object?> get props => [id, name, role];

  factory SchedulingEmployeeEntity.fromJson(Map<String, dynamic> json) {
    return SchedulingEmployeeEntity(
      id: json['id'],
      name: json['name'],
      role: json['role'],
      start: json['start'] != null ? DateTime.parse(json['start']) : null,
      end: json['end'] != null ? DateTime.parse(json['end']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'role': role,
      'start': start?.toIso8601String(),
      'end': end?.toIso8601String(),
    };
  }

  @override
  String toString(){
    return name;
  }

}
