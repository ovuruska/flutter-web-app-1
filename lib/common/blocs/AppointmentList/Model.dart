

import 'package:scrubbers_employee_application/models/Appointment.dart';

class AppointmentListModel {
  List<Appointment> appointments = [];


  setAppointments(List<Appointment> appointments) {
    this.appointments = appointments;
    return this;
  }

  patchAppointment(Appointment appointment) {
    var index = appointments.indexWhere((a) => a.id == appointment.id);
    if (index == -1) {
      appointments.add(appointment);
    } else {
      appointments[index] = appointment;
    }
    return this;
  }

  removeAppointment(Appointment appointment) {
    this.appointments = this.appointments.where((a) => a.id != appointment.id).toList();
    return this;
  }
}