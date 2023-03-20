

import 'package:equatable/equatable.dart';

class AppointmentEntity extends Equatable{
  final int id;
  final int customerId;
  final int petId;
  final DateTime start;
  final DateTime end;
  final int branchId;
  final int employeeId;

  const AppointmentEntity({
    required this.id,
    required this.customerId,
    required this.petId,
    required this.start,
    required this.end,
    required this.branchId,
    required this.employeeId,
  });

  @override
  List<Object?> get props => [id, customerId,petId,start, end, branchId, employeeId];

  Map<String,dynamic> toJson(){
    return {
      "id": id,
      "customer__id": customerId,
      "dog": petId,
      "start": start.toIso8601String(),
      "end": end.toIso8601String(),
      "branch": branchId,
      "employee": employeeId,
    };
  }

}