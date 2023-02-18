import '../../models/Appointment.dart';

class AppointmentsModel {
  List<Appointment> appointments = [];

  setAppointments(List<Appointment> appointments) {
    this.appointments = appointments;
    return this;
  }

  updateAppointment(Appointment appointment) {
    this.appointments = appointments.map((e) => e.id == appointment.id ? appointment : e).toList();
    return this;
  }

  addAppointment(Appointment branch) {
    appointments.add(branch);
    return this;
  }

  removeAppointment(int index){
    appointments.removeAt(index);
    return this;
  }

}
