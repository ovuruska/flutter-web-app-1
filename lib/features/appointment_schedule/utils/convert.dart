import 'package:scrubbers_employee_application/common/scheduling/models/scheduling_appointment_entity.dart';

import '../../../core/domain/entities/appointment.dart';

SchedulingAppointmentEntity convertFromAppointmentEntity(
    AppointmentEntity appointmentEntity) {

  double invoice = 0;
  invoice += appointmentEntity.tip;
  for (var product in appointmentEntity.products) {
    invoice += product.cost;
  }


  return SchedulingAppointmentEntity(id: appointmentEntity.id,
      status: appointmentEntity.status,
      customerName: appointmentEntity.customer.name,
      employee: appointmentEntity.employee.id,
      service: appointmentEntity.service,
      breed: appointmentEntity.pet.breed,
      dogName: appointmentEntity.pet.name,
      start: appointmentEntity.start,
      employeeName: appointmentEntity.employee.name,
      end: appointmentEntity.end,
      invoice: invoice,
      specialHandling: appointmentEntity.pet.specialHandling,
      branch: appointmentEntity.branch.id,
      branchName: appointmentEntity.branch.name);
}