

import 'package:scrubbers_employee_application/models/Customer.dart';

class CustomersModel {
  List<Customer> customers = [];

  setCustomers(List<Customer> customers){
    this.customers = customers;
    return this;
  }




}