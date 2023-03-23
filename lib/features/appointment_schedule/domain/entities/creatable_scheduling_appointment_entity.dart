import 'package:scrubbers_employee_application/common/scheduling/models/scheduling_appointment_entity.dart';

class CreatableSchedulingAppointmentEntity extends SchedulingAppointmentEntity {
  final List<int> products;
  final int dogId;
  final int customerId;

  CreatableSchedulingAppointmentEntity(
      {id = -1,
      required this.products,
      required int this.customerId,
      required int this.dogId,
      required String status,
      required String customerName,
      required int employee,
      required String service,
      required String breed,
      required String dogName,
      required DateTime start,
      required String employeeName,
      required DateTime end,
      required double invoice,
      required bool specialHandling,
      required int branch,
      required String branchName})
      : super(
            id: id,
            status: status,
            customerName: customerName,
            employee: employee,
            service: service,
            breed: breed,
            dogName: dogName,
            start: start,
            employeeName: employeeName,
            end: end,
            invoice: invoice,
            specialHandling: specialHandling,
            branch: branch,
            branchName: branchName);

  Map<String, dynamic> toJson() {
    return {
      "customer__id": customerId,
      "dog": dogId,
      "start": start.toIso8601String(),
      "end": end.toIso8601String(),
      "branch": branch,
      "employee": employee,
      "products": products
    };
  }

  CreatableSchedulingAppointmentEntity copyWith({
    int? id,
    String? status,
    String? customerName,
    int? employee,
    String? employeeName,
    String? service,
    String? breed,
    String? dogName,
    DateTime? start,
    DateTime? end,
    double? invoice,
    int? branch,
    String? branchName,
    bool? specialHandling,
    List<int>? products,
    int? dogId,
    int? customerId,
  }) =>
      CreatableSchedulingAppointmentEntity(
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
          branch: branch ?? this.branch,
          branchName: branchName ?? this.branchName,
          products: products ?? this.products,
          dogId: dogId ?? this.dogId,
          customerId: customerId ?? this.customerId
      );



}
