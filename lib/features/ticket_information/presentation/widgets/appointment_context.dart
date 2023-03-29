

import 'package:flutter/material.dart';
import 'package:scrubbers_employee_application/core/domain/entities/appointment.dart';

import '../../../../core/domain/entities/product_entity.dart';

class AppointmentContext extends ChangeNotifier {
  AppointmentEntity appointment;

  AppointmentContext({required this.appointment});


  setStatus(String status){
    appointment = appointment.update(status: status);
    notifyListeners();
    return this;
  }

  setProducts(List<ProductEntity> products){
    appointment = appointment.update(products: products);
    notifyListeners();
    return this;
  }

  setEmployeeNotes(String notes){
    appointment = appointment.update(employeeNotes: notes);
    notifyListeners();
    return this;
  }


}
