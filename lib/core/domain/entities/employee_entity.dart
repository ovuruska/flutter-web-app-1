

import '../constants/roles.dart';

class EmployeeEntity {
  final int id;
  final String name;
  final String? email;
  final String? phone;
  final String role;

  EmployeeEntity({
    required this.id,
    required this.name,
    this.email,
    this.phone,
    required this.role,
  });

  factory EmployeeEntity.fromJson(Map<String, dynamic> json) {
    return EmployeeEntity(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      role: getRole(json['role']),
    );
  }

  @override
  String toString() => name;
}
