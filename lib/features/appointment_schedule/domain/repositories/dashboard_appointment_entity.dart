import 'package:equatable/equatable.dart';

class DashboardAppointmentEntity extends Equatable {
  final int id;
  final String customerName;
  final int employee;
  final String service;
  final String breed;
  final String dogName;
  final DateTime start;
  final DateTime end;
  final double invoice;
  final bool specialHandling;

  DashboardAppointmentEntity({
    required this.id,
    required this.customerName,
    required this.employee,
    required this.service,
    required this.breed,
    required this.dogName,
    required this.start,
    required this.end,
    required this.invoice,
    required this.specialHandling
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        customerName,
        employee,
        service,
        breed,
        dogName,
        start,
        end,
        invoice,
      ];

  factory DashboardAppointmentEntity.fromJson(Map<String, dynamic> json) {
    return DashboardAppointmentEntity(
      id: json['id'],
      customerName: json['customer']['name'],
      specialHandling: json['dog']['special_handling'],
      employee: json['employee']['id'],
      service: json['service'],
      breed: json['dog']['breed'],
      dogName: json['dog']['name'],
      start: DateTime.parse(json['start']),
      end: DateTime.parse(json['end']),
      invoice: json['cost'],
    );
  }
}
