import 'package:scrubbers_employee_application/models/Employee.dart';
import 'package:scrubbers_employee_application/pages/dashboard/sidebar/controller.dart';

var totalInvoiceOfEmployee = (Employee employee) {
  double total = 0;
  var appointments = sidebarBloc.value.calendarAppointments;
  for (var appointment in appointments) {
    if (appointment.employee.id == employee.id) {
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