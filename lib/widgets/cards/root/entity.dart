import 'package:equatable/equatable.dart';
import 'package:intl/intl.dart';

class DashboardAppointmentEntity extends Equatable {
  final int id;
  final String customerName;
  final int employee;
  final String employeeName;
  final String service;
  final String breed;
  final String dogName;
  final String status;
  final DateTime start;
  final DateTime end;
  final double invoice;
  final bool specialHandling;
  bool editable;

  DashboardAppointmentEntity(
      {required this.id,
      required this.status,
      required this.customerName,
      required this.employee,
      required this.service,
      required this.breed,
      required this.dogName,
      required this.start,
      required this.employeeName,
      required this.end,
      required this.invoice,
      required this.specialHandling,
      this.editable = true,
      });

  @override
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

  static String? decodeDateTime(DateTime? dateTime) {
    if (dateTime == null) return null;
    return dateTime.toUtc().toIso8601String();
  }

  factory DashboardAppointmentEntity.fromJson(Map<String, dynamic> json) =>
      DashboardAppointmentEntity(
          id: json['id'],
          customerName: json['customer']['name'],
          specialHandling: json['dog']['special_handling'],
          employee: json['employee']['id'],
          employeeName: json['employee']['name'],
          service: json['appointment_type'],
          breed: json['dog']['breed'],
          dogName: json['dog']['name'],
          start: DateTime.parse(json['start']).toLocal(),
          end: DateTime.parse(json['end']).toLocal(),
          invoice: double.parse(json['cost']),
          status: json['status']);

  DashboardAppointmentEntity copyWith({
    int? id,
    String? status,
    String? customerName,
    int? employee,
    String? service,
    String? breed,
    String? dogName,
    DateTime? start,
    DateTime? end,
    double? invoice,
    bool? specialHandling,
  }) =>
      DashboardAppointmentEntity(
        id: id ?? this.id,
        status: status ?? this.status,
        customerName: customerName ?? this.customerName,
        employee: employee ?? this.employee,
        service: service ?? this.service,
        breed: breed ?? this.breed,
        dogName: dogName ?? this.dogName,
        start: start ?? this.start,
        end: end ?? this.end,
        invoice: invoice ?? this.invoice,
        employeeName: employeeName ?? this.employeeName,
        specialHandling: specialHandling ?? this.specialHandling,
      );

  Map<String, dynamic> toJson() {

    return {
      "status": status,
      "employee": employee,
      "start": decodeDateTime(start),
      "end": decodeDateTime(end),
      "appointment_type": service,
    };
  }
}
