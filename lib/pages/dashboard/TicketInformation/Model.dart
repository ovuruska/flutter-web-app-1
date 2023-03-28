import 'package:scrubbers_employee_application/models/Appointment.dart';
import 'package:scrubbers_employee_application/models/CustomerDetails.dart';
import 'package:scrubbers_employee_application/models/Employee.dart';

class TicketInformationInputModel {
  AppointmentEntity? appointment;
  List<AppointmentEntity> priorAppointments = [];
  List<AppointmentEntity> upcomingAppointments = [];
  CustomerDetails? customerDetails;

  setUpcomingAppointments(List<AppointmentEntity> appointments) {
    upcomingAppointments = appointments;
    return this;
  }

  setCustomerDetails(CustomerDetails? details){
    customerDetails = details;
    return this;
  }

  setTip(double val) {
    appointment!.tip = val;
    return this;
  }

  setSpecialHandling(bool value){
    appointment!.dog.specialHandling = value;
    return this;
  }

  setEmployeeNotes(String? val) {
    appointment!.dog.employeeNotes = val ?? "";
    return this;
  }

  setPriorAppointments(List<AppointmentEntity> appointments) {
    priorAppointments = appointments;
    return this;
  }

  setAppointment(AppointmentEntity? appointment) {
    this.appointment = appointment;
    return this;
  }

  setAggressive(bool? value) {
    if (value == null) value = false;
    appointment!.specialHandling = value;
    return this;
  }

  setCheckIn(DateTime? value) {
    appointment!.checkIn = value;
    return this;
  }

  setReminderSent(DateTime? value) {
    appointment!.reminderSent = value;
    return this;
  }

  setPickUp(DateTime? value) {
    appointment!.pickUp = value;
    return this;
  }

  setConfirmedOn(DateTime? value) {
    appointment!.confirmedOn = value;
    return this;
  }

  setCheckoutBy(Employee? employee) {
    appointment!.checkoutBy = employee;
    return this;
  }

  setCheckoutStatus(bool? value) {
    if (value == null) value = false;
    appointment!.checkoutStatus = value;
    if (value == true)
      appointment!.checkoutTime = DateTime.now();
    else {
      appointment!.checkoutTime = null;
      appointment!.checkoutBy = null;
      appointment!.checkoutStatus = false;
    }
    return this;
  }

  setCheckout(DateTime? value) {
    appointment!.checkoutTime = value;
    return this;
  }

  setSubmitted(bool? value) {
    if (value == null) {
      value = false;
    } else {
      appointment!.submitted = value;
    }
    return this;
  }
}
