



import 'package:scrubbers_employee_application/blocs/customers/Controller.dart';
import 'package:scrubbers_employee_application/common/Bloc.dart';
import 'package:scrubbers_employee_application/models/Customer.dart';

import 'Model.dart';

class CustomersViewBloc extends Bloc<CustomersViewModel> {
  CustomersViewBloc() {
    subject.sink.add(CustomersViewModel());
  }

  setCurrentIndex (int index) {
    subject.sink.add(value.setCurrentIndex(index));
  }

  setCustomerName(String name) {
    subject.sink.add(subject.value.setCustomerQuery(name));
  }

  clearCustomerName() {
    subject.sink.add(subject.value.clearCustomerQuery());
  }

  List<Customer> getQueryResults() {
      return customersBloc.value.customers.where((element) {
        if(subject.value.customerQuery == "" || element.name.contains(subject.value.customerQuery.toLowerCase())) {
            return true;
          }
        return false;
      }).toList();
  }

}

final customersViewBloc = CustomersViewBloc();