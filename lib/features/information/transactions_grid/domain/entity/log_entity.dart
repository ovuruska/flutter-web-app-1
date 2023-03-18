import 'customer_entity.dart';
import 'employee_entity.dart';
import 'target_entity.dart';

class LogEntity {
  final int id;
  final String description;
  final TargetEntity target;
  final DateTime createdAt;
  final String action;

  LogEntity({
    required this.id,
    required this.description,
    required this.target,
    required this.createdAt,
    required this.action,
  });

  factory LogEntity.fromJson(Map<String, dynamic> json) {
    return LogEntity(
      id: json['id'],
      description: json['description'],
      target: json["customer"] != null
          ? CustomerEntity.fromJson(json['customer'])
          : EmployeeEntity.fromJson(json['employee']),
      createdAt: DateTime.parse(json['updated_at']),
      action: json['action'],
    );
  }

  bool isCustomer() {
    return target is CustomerEntity;
  }

  bool isEmployee() {
    return target is EmployeeEntity;
  }
}
