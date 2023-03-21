


import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scrubbers_employee_application/core/domain/entities/product_entity.dart';

import '../../../../../core/domain/usecases/get_all_products.dart';
import '../../../../../core/use_case.dart';
import 'product_select_event.dart';
import 'product_select_state.dart';

class ProductSelectBloc extends Bloc<ProductSelectEvent,ProductSelectState>{
  final GetAllProductsUseCase getAllProducts;

  ProductSelectBloc(this.getAllProducts) : super(ProductSelectState()){
    on<ProductSelectEventFetch>((event, emit) async {
      var params = NoParams();
      var response = await getAllProducts(params);
      List<ProductEntity> products = response.fold((l) => [], (r) => r);
      emit(ProductSelectState(options: products));
    });
  }

}