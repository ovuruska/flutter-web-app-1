

import 'package:scrubbers_employee_application/models/Pet.dart';

class CustomersViewModel {

  String customerQuery = "";
  int currentIndex = 0;

  setCustomerQuery (String value){
    this.customerQuery = value;
    return this;
  }

  clearCustomerQuery (){
    this.customerQuery = "";
    return this;
  }

  setCurrentIndex (int index){
    this.currentIndex = index;
    return this;
  }




}