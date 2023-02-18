import 'package:scrubbers_employee_application/common/Bloc.dart';
import 'package:scrubbers_employee_application/models/Appointment.dart';
import 'package:scrubbers_employee_application/models/CustomerDetails.dart';
import 'package:scrubbers_employee_application/models/Employee.dart';

import 'Model.dart';


class TicketInformationInputBloc extends Bloc<TicketInformationInputModel> {

  TicketInformationInputBloc() {
    subject.sink.add(TicketInformationInputModel());
  }

  setAppointment(Appointment? appointment) {
    subject.sink.add(value.setAppointment(appointment));
  }

  setAggressive(bool? val) {
    subject.sink.add(value.setAggressive(val));
  }

  setCheckIn(DateTime? val) {
    subject.sink.add(value.setCheckIn(val));
  }

  setReminderSent(DateTime? val) {
    subject.sink.add(value.setReminderSent(val));
  }

  setPickUp(DateTime? val) {
    subject.sink.add(value.setPickUp(val));
  }

  setConfirmedOn(DateTime? val) {
    subject.sink.add(value.setConfirmedOn(val));
  }

  setTip(double val) {
    subject.sink.add(value.setTip(val));
  }


  setUpcomingAppointments(List<Appointment> appointments) {
    subject.sink.add(value.setUpcomingAppointments(appointments));
  }

  setPriorAppointments(List<Appointment> appointments) {
    subject.sink.add(value.setPriorAppointments(appointments));
  }

  setSpecialHandling(bool value){
    subject.sink.add(this.value.setSpecialHandling(value));
  }

  setSubmitted(bool? val) {
    if(subject.value.appointment?.modifiable){
      subject.sink.add(value.setSubmitted(val));
    }
  }
  setCheckout(DateTime ?val){
    subject.sink.add(value.setCheckout(val));
  }

  setCustomerDetails(CustomerDetails? details){
    subject.sink.add(value.setCustomerDetails(details));
  }

}

final ticketInformationInputBloc = TicketInformationInputBloc();
