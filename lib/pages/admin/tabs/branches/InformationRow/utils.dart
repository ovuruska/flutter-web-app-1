

import 'package:flutter/material.dart';
import 'package:scrubbers_employee_application/models/Branch.dart';
import 'package:scrubbers_employee_application/pages/dashboard/sidebar/controller.dart';

final textPadding = (Widget widget){
  return Padding(
    padding: EdgeInsets.all(8),
    child: widget,
  );
};

var totalInvoiceOfBranch = (Branch branch) {
  double total = 0;
  var appointments = sidebarBloc.value.calendarAppointments;
  for (var appointment in appointments) {
    if (appointment.branch.id == branch.id) {
      for (var service in appointment.services) {
        total += service.cost;
      }

      for (var product in appointment.products) {
        total += product.cost;
      }

      total += appointment.tip;
    }
  }
  return total;
};