

import 'package:flutter/material.dart';
import 'package:scrubbers_employee_application/core/domain/entities/appointment.dart';

class AppointmentContext extends ChangeNotifier {
  AppointmentEntity appointment;

  AppointmentContext({required this.appointment});


  setStatus(String status){
    appointment = appointment.update(status: status);
    notifyListeners();
    return this;
  }



}
