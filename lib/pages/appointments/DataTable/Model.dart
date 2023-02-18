

import 'package:scrubbers_employee_application/models/Appointment.dart';

class AppointmentsDataTableModel {

  List<Appointment> data = [];
  bool isLoading = false;

  setData(List<Appointment> data){
    this.data = data;
    return this;
  }

  setIsLoading(bool isLoading){
    this.isLoading = isLoading;
    return this;
  }


}