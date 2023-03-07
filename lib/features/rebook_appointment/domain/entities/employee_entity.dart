import 'package:equatable/equatable.dart';

class EmployeeEntity extends Equatable {
  final int id;
  final String name;
  final String role;

  EmployeeEntity({required this.id, required this.name, required this.role});

  List<Object?> get props => [id];

  static String getRole(int role) {switch (role) {
      case 10:
        return "We Wash";
      case 15:
        return "Full Grooming";
      case 20:
        return "Accountant";
      case 30:
        return "Manager";
      case 40:
        return "Admin";
      default:
        return "Employee";
    }
  }

  factory EmployeeEntity.fromJson(Map<String, dynamic> json) => EmployeeEntity(
        id: json['id'],
        name: json['name'],
        role: getRole(json['role'] as int),
      );

  @override
  String toString() {
    return this.name;
  }
}
