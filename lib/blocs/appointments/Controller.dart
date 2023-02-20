import 'package:scrubbers_employee_application/common/Bloc.dart';
import 'package:scrubbers_employee_application/models/Appointment.dart';
import 'package:scrubbers_employee_application/repositories/appointment.dart';
import 'Model.dart';

class AppointmentsBloc extends Bloc<AppointmentsModel> {
  AppointmentsBloc() {
    subject.sink.add(AppointmentsModel());
  }

  setAppointments(List<Appointment> appointments) {
    subject.sink.add(subject.value.setAppointments(appointments));
  }

  updateAppointment(
      int index, Map<Symbol,dynamic> params) {
    var appointment = subject.value.appointments[index];
    var newAppointment = Function.apply(appointment.update,[],params);
    subject.sink.add(subject.value.updateAppointment(newAppointment));
  }



  addAppointment(Appointment appointment) {
    subject.sink.add(subject.value.addAppointment(appointment));
  }

  removeAppointment(int index){
    subject.sink.add(subject.value.removeAppointment(index));
  }

}

final appointmentsBloc = AppointmentsBloc();