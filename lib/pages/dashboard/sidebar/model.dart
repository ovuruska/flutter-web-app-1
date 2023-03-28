import 'package:scrubbers_employee_application/models/Appointment.dart';
import 'package:scrubbers_employee_application/models/Branch.dart';

class SidebarModel {
  Branch currentBranch = Branch.empty();
  List<AppointmentEntity> calendarAppointments = [];

  setCalendarAppointments(List<AppointmentEntity> appointments) {
    this.calendarAppointments = appointments;
    return this;
  }

  setBranch(Branch branch) {
    currentBranch = branch;
    return this;
  }


  patchAppointment(AppointmentEntity appointment) {
    bool found = false;
    this.calendarAppointments = this.calendarAppointments.map((a) {
      if (a.id == appointment.id) {
        found = true;
        return appointment;
      }
      return a;
    }).toList();
    if(!found){
      this.calendarAppointments.add(appointment);
    }
    return this;
  }


}
