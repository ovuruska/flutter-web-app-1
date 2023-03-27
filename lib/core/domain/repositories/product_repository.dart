

import 'package:dartz/dartz.dart';

import '../../error/failures.dart';
import '../entities/product_entity.dart';

abstract class ProductRepository  {
  Future<Either<Failure, List<ProductEntity>>> getProducts();
}