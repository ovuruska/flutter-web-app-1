import '../../models/Appointment.dart';

class AppointmentsModel {
  List<AppointmentEntity> appointments = [];

  setAppointments(List<AppointmentEntity> appointments) {
    this.appointments = appointments;
    return this;
  }

  updateAppointment(AppointmentEntity appointment) {
    this.appointments = appointments.map((e) => e.id == appointment.id ? appointment : e).toList();
    return this;
  }

  addAppointment(AppointmentEntity branch) {
    appointments.add(branch);
    return this;
  }

  removeAppointment(int index){
    appointments.removeAt(index);
    return this;
  }

}
