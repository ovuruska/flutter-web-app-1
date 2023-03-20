

import 'package:equatable/equatable.dart';

class AppointmentEntity extends Equatable{
  final int id;
  final String customerName;
  final String customerPhone;
  final String customerEmail;
  final String dogName;
  final String dogBreed;
  final DateTime start;
  final DateTime end;
  final int branchId;
  final int employeeId;

  const AppointmentEntity({
    required this.id,
    required this.customerName,
    required this.customerPhone,
    required this.customerEmail,
    required this.dogName,
    required this.dogBreed,
    required this.start,
    required this.end,
    required this.branchId,
    required this.employeeId,
  });

  @override
  List<Object?> get props => [id, customerName, customerPhone, customerEmail, dogName, dogBreed, start, end, branchId, employeeId];

  factory AppointmentEntity.fromJson(Map<String, dynamic> json) => AppointmentEntity(
    id: json['id'],
    customerName: json['customerName'],
    customerPhone: json['customerPhone'],
    customerEmail: json['customerEmail'],
    dogName: json['dogName'],
    dogBreed: json['dogBreed'],
    start: DateTime.parse(json['start']),
    end: DateTime.parse(json['end']),
    branchId: json['branchId'],
    employeeId: json['employeeId'],
  );

  @override
  String toString() {
    return "Dog: $dogName, Customer: $customerName @ $start";
  }

  Map<String,dynamic> toJson(){
    return {
      "id": id,
      "customer_name": customerName,
      "customer_phone": customerPhone,
      "customer_email": customerEmail,
      "dog_name": dogName,
      "dog_breed": dogBreed,
      "start": start.toIso8601String(),
      "end": end.toIso8601String(),
      "branch_id": branchId,
      "employee_id": employeeId,
    };
  }

}