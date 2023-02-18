

import '../../models/Appointment.dart';
import '../../models/Branch.dart';
import '../../models/Employee.dart';



class DashboardModel {

  List<Employee> employees = [];
  String currentService = "Full Grooming";
  bool showConfirmed = true;
  bool showPending = true;
  bool showCancelled = true;
  bool showCompleted = true;
  bool scrollUpdated = false;
  List<Appointment> appointments = [];

  setAppointments(List<Appointment> appointments){
    this.appointments = appointments;
    return this;
  }

  patchAppointment(Appointment appointment){
    bool found = false;
    this.appointments = this.appointments.map((a) {
      if (a.id == appointment.id) {
        found = true;
        return appointment;
      }
      return a;
    }).toList();
    if(!found){
      this.appointments.add(appointment);
    }
    return this;
  }

  setScrollUpdated(){
    this.scrollUpdated = true;
    return this;
  }

  clearScrollUpdated(){
    this.scrollUpdated = false;
    return this;
  }


  setService(String service) {
    currentService = service;
    return this;
  }

  setEmployees(List<Employee> employees) {
    this.employees = employees;
    return this;
  }

  setShowConfirmed(bool showConfirmed) {
    this.showConfirmed = showConfirmed;
    return this;
  }

  setShowPending(bool showPending) {
    this.showPending = showPending;
    return this;
  }

  setShowCancelled(bool showCancelled) {
    this.showCancelled = showCancelled;
    return this;
  }

  setShowCompleted(bool showCompleted) {
    this.showCompleted = showCompleted;
    return this;
  }


}