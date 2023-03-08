import 'package:equatable/equatable.dart';

class EmployeeEntity extends Equatable {
  final int id;
  final String name;
  final String phone;
  final String email;
  final int role;

  EmployeeEntity({
    required this.id,
    required this.name,
    required this.phone,
    required this.email,
    required this.role,
  });

  @override
  List<Object?> get props => [];

  factory EmployeeEntity.fromJson(Map<String, dynamic> json) {

    return EmployeeEntity(
      id: json['id'],
      name: json['name'],
      phone: json['phone'],
      email: json['email'],
      role: json['role'],
    );
  }

}
