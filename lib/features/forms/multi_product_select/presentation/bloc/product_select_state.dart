import 'package:equatable/equatable.dart';

import '../../../../../core/domain/entities/product_entity.dart';

class MultiProductSelectState extends Equatable {
  final List<ProductEntity> options;

  MultiProductSelectState({this.options = const []});

  @override
  List<Object?> get props => [options];
}
