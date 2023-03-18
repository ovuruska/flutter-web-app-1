import 'package:equatable/equatable.dart';

class DashboardEmployeeEntity extends Equatable {
  final int id;
  final String name;
  final String role;
  final DateTime? start;
  final DateTime? end;

  DashboardEmployeeEntity({
    required this.id,
    required this.name,
    required this.role,
    this.start,
    this.end,
  });

  @override
  List<Object?> get props => [id, name, role];

  factory DashboardEmployeeEntity.fromJson(Map<String, dynamic> json) {
    return DashboardEmployeeEntity(
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
