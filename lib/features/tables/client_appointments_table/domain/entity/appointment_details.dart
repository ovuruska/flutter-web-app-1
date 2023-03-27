

import 'package:equatable/equatable.dart';

class AppointmentDetails extends Equatable{
  AppointmentDetails( {
    required this.id,
    required this.name,
    required this.address,
    required this.phoneNumber,
    required this.email,
    required this.petName,
    required this.petBreed,
    required this.start,
    required this.end,
    required this.employeeId,
    required this.employeeName,
    required this.specialHandling,
    required this.service,
    required this.status,
    required this.groomerNotes,

  });

  @override
  List<Object?> get props => throw UnimplementedError();

  final int id;
  final String name;
  final String address;
  final String phoneNumber;
  final String email;
  final String petName;
  final String petBreed;
  final DateTime start;
  final DateTime end;
  final int employeeId;
  final String employeeName;
  final bool specialHandling;
  final String service;
  final String status;
  final String groomerNotes;

  factory AppointmentDetails.fromJson(Map<String, dynamic> json) {
    return AppointmentDetails(
      id: json['id'],
      name: json["customer"]['name'] ?? "",
      address: json["customer"]['address'] ?? "",
      phoneNumber: json["customer"]['phone'] ?? "",
      email: json["customer"]['email'] ?? "",
      petName: json['dog']['name'] ?? "",
      petBreed: json['dog']['breed'] ?? "",
      start: DateTime.parse(json['start']),
      end: DateTime.parse(json['end']),
      employeeId: json['employee']['id'] ,
      employeeName: json['employee']['name'] ?? "",
      specialHandling: json['special_handling'] ?? false,
      service: json['appointment_type'],
      status: json['status'] ?? "Pending",
      groomerNotes: json['employee_notes'] ?? "",
    );
  }

}