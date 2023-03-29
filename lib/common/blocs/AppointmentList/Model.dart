

import 'package:scrubbers_employee_application/models/Appointment.dart';

class AppointmentListModel {
  List<AppointmentEntity> appointments = [];


  setAppointments(List<AppointmentEntity> appointments) {
    this.appointments = appointments;
    return this;
  }

  patchAppointment(AppointmentEntity appointment) {
    var index = appointments.indexWhere((a) => a.id == appointment.id);
    if (index == -1) {
      appointments.add(appointment);
    } else {
      appointments[index] = appointment;
    }
    return this;
  }

  removeAppointment(AppointmentEntity appointment) {
    this.appointments = this.appointments.where((a) => a.id != appointment.id).toList();
    return this;
  }
}