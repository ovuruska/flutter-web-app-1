

import 'package:scrubbers_employee_application/models/Product.dart';

class ProductsBlocModel {
  List<Product> products = [];

  setEmployees(List<Product> products) {
    this.products = products;
    return this;
  }


}