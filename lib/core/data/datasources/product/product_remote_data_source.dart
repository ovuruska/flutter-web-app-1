

import 'package:dartz/dartz.dart';

import '../../../domain/entities/product_entity.dart';
import '../../../error/failures.dart';
import '../../../remote_data_source.dart';

abstract class ProductRemoteDataSource extends RemoteDataSource {

  Future<Either<Failure, List<ProductEntity>>> getProducts();

}