import 'package:scrubbers_employee_application/models/Product.dart';

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
