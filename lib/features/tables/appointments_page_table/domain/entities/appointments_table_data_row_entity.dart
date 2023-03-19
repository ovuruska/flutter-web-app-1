import 'package:equatable/equatable.dart';

class AppointmentsTableDataRowEntity extends Equatable{
  final int id;
  final DateTime start;
  final DateTime end;
  final String animal = "Dog";
  final String service;
  final String employeeName;
  final int employeeId;
  final String clientName;
  final String clientEmail;
  final String clientPhone;
  final String petName;
  final int petId;
  final bool specialHandling;
  final int branchId;
  final String branchName;

  AppointmentsTableDataRowEntity({
    required this.id,
    required this.start,
    required this.end,
    required this.service,
    required this.employeeName,
    required this.employeeId,
    required this.clientName,
    required this.clientEmail,
    required this.clientPhone,
    required this.petName,
    required this.petId,
    required this.specialHandling,
    required this.branchId,
    required this.branchName
  });

  @override
  List<Object?> get props => [
        id,
        start,
        end,
        animal,
        service,
        employeeName,
        employeeId,
        clientName,
        clientEmail,
        clientPhone,
        petName,
        petId,
        specialHandling,
        branchId,
        branchName
      ];



  factory AppointmentsTableDataRowEntity.fromJson(Map<String, dynamic> json) {
    return AppointmentsTableDataRowEntity(
      id: json['id'],
      start: DateTime.parse(json['start']).toLocal(),
      end: DateTime.parse(json['end']).toLocal(),
      service: json['appointment_type'],
      employeeName: json['employee']['name'],
      employeeId: json['employee']['id'],
      clientName: json['customer']['name'],
      clientEmail: json['customer']['email'] ?? "",
      clientPhone: json['customer']['phone'] ?? "",
      petName: json['dog'] == null ? "" : json['dog']['name'],
      petId: json['dog'] == null ? 0 : json['dog']['id'],
      specialHandling: json['specialHandling'] ?? false,
      branchId: json['branch']['id'],
      branchName: json['branch']['name'] ?? ""
    );
  }

}