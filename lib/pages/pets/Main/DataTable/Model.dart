

import 'package:scrubbers_employee_application/models/Appointment.dart';

class PetsMainDataTableModel {
  List<Appointment> appointments;
  List<Appointment> filtered;

  PetsMainDataTableModel({this.appointments = const [],this.filtered = const []});
  setAppointments(List<Appointment> appointments){
    this.appointments = appointments;
    return this;
  }

  setFiltered(List<Appointment> filtered){
    this.filtered = filtered;
    return this;
  }
}