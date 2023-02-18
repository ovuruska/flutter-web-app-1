

import 'package:scrubbers_employee_application/models/Appointment.dart';

class AppointmentsSearchModel {
  String customerName = "";
  String? branch = null;
  DateTime? appointmentDate = null;
  String? serviceType = null;
  String? employee = null;
  String? status = null;
  bool isLoading = false;

  AppointmentsSearchModel();

  setIsLoading(bool isLoading){
    this.isLoading = isLoading;
    return this;
  }

  setAppointmentStatus(String? status) {
    this.status = status;
    return this;
  }

  setEmployee(String? employee) {
    this.employee = employee;
    return this;
  }

  setCustomerName(String customerName){
    this.customerName = customerName;
    return this;
  }

  setBranch(String? branch){
    this.branch = branch;
    return this;
  }
  setAppointmentDate(DateTime? appointmentDate){
    this.appointmentDate = appointmentDate;
    return this;
  }

  setServiceType(String? serviceType){
    this.serviceType = serviceType;
    return this;
  }

}