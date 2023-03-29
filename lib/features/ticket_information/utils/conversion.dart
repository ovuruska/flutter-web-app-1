

import '../../../common/scheduling/models/scheduling_appointment_entity.dart';
import '../../../core/domain/entities/appointment.dart';

extension ConvertApptToScheduling on AppointmentEntity{
  
  toSchedulingAppointmentEntity(){
    return SchedulingAppointmentEntity(
      id: id,
      status: status,
      customerName: customer.name,
      employee: employee.id,
      service: service,
      breed: pet.breed,
      dogName: pet.name,
      start: start,
      end: end,
      employeeName: employee.name,
      branch: branch.id,
      specialHandling: specialHandling,
      branchName: branch.name,
      invoice: 0,
    );
  }
}