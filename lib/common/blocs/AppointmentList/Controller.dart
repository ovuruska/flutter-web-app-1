


import 'package:scrubbers_employee_application/common/Bloc.dart';
import 'package:scrubbers_employee_application/models/Appointment.dart';

import 'Model.dart';

class AppointmentListBloc extends Bloc<AppointmentListModel> {
  AppointmentListBloc() {
    subject.sink.add(AppointmentListModel());
  }

  setAppointments(List<AppointmentEntity> appointments) {
    subject.sink.add(subject.value.setAppointments(appointments));
  }

  patchAppointment(AppointmentEntity appointment){
    subject.sink.add(subject.value.patchAppointment(appointment));
  }

  removeAppointment(AppointmentEntity appointment) {
    subject.sink.add(subject.value.removeAppointment(appointment));
  }
}