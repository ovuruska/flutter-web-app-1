

import 'package:scrubbers_employee_application/models/Appointment.dart';
import 'package:scrubbers_employee_application/models/Customer.dart';
import 'package:scrubbers_employee_application/pages/dashboard/sidebar/controller.dart';

List<Appointment> getCustomerAppointments(Customer customer){
  return sidebarBloc.value.calendarAppointments.where((element) => element.customer.id == customer.id).toList();
}