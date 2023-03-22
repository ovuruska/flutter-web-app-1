import 'package:equatable/equatable.dart';

import '../../../../../core/domain/entities/product_entity.dart';

class ProductSelectState extends Equatable {
  final List<ProductEntity> options;

  ProductSelectState({this.options = const []});

  @override
  List<Object?> get props => [options];
}
