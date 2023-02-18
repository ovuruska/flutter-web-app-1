


import 'package:scrubbers_employee_application/common/Bloc.dart';
import 'package:scrubbers_employee_application/models/Appointment.dart';

import 'Model.dart';

class AppointmentListBloc extends Bloc<AppointmentListModel> {
  AppointmentListBloc() {
    subject.sink.add(AppointmentListModel());
  }

  setAppointments(List<Appointment> appointments) {
    subject.sink.add(subject.value.setAppointments(appointments));
  }

  patchAppointment(Appointment appointment){
    subject.sink.add(subject.value.patchAppointment(appointment));
  }

  removeAppointment(Appointment appointment) {
    subject.sink.add(subject.value.removeAppointment(appointment));
  }
}