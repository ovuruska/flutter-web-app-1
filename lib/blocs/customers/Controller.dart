import 'package:scrubbers_employee_application/common/Bloc.dart';
import 'package:scrubbers_employee_application/models/Customer.dart';

import 'Model.dart';

class CustomersBloc extends Bloc<CustomersModel> {
  CustomersBloc() {
    subject.sink.add(CustomersModel());
  }

  setCustomers(List<Customer> customers) {
    subject.sink.add(subject.value.setCustomers(customers));
  }
}

final customersBloc = CustomersBloc();
