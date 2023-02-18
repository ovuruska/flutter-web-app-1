import 'package:scrubbers_employee_application/blocs/branches/Controller.dart';
import 'package:scrubbers_employee_application/blocs/employees/Model.dart';
import 'package:scrubbers_employee_application/models/Branch.dart';
import 'package:scrubbers_employee_application/models/Employee.dart';
import 'package:scrubbers_employee_application/models/Product.dart';
import 'package:uuid/uuid.dart';

import '../../common/Bloc.dart';
import 'Model.dart';

class ProductsBloc extends Bloc<ProductsBlocModel> {
  ProductsBloc() {
    subject.add(ProductsBlocModel());
  }

  setProducts(List<Product> products) {
    subject.sink.add(subject.value.setEmployees(products));
  }


}

final productsBloc = ProductsBloc();
