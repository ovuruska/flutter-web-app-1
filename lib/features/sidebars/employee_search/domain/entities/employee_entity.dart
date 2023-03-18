

import 'package:equatable/equatable.dart';

class EmployeeEntity extends Equatable {
  final int id;
  final String name;

  EmployeeEntity({
    required this.id,
    required this.name,
  });

  @override
  List<Object?> get props => [id, name];

  factory EmployeeEntity.fromJson(Map<String, dynamic> json) {
    return EmployeeEntity(
      id: json['id'],
      name: json['name'],
    );
  }


}