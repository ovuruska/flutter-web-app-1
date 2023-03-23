import 'package:equatable/equatable.dart';

class AppointmentEntityLocal extends Equatable {
  final int customer;
  final int pet;
  final DateTime start;
  final DateTime end;
  final int branch;
  final int employee;
  final List<int> products;
  final String service;

  const AppointmentEntityLocal(
      { required this.customer, required this.service, required this.pet, required this.start, required this.end, required this.branch, required this.employee,required this.products});

  @override
  List<Object?> get props =>
      [ customer, pet, start, end, branch, employee];

  Map<String, dynamic> toJson() {
    return {
      "customer": customer,
      "dog": pet,
      "start": start.toIso8601String(),
      "end": end.toIso8601String(),
      "branch": branch,
      "employee": employee,
      "products": products,
      "service":service
    };
  }

}
