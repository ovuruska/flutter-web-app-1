



import 'package:dartz/dartz.dart';

import 'package:scrubbers_employee_application/core/domain/entities/product_entity.dart';

import 'package:scrubbers_employee_application/core/error/failures.dart';

import '../../domain/repositories/product_repository.dart';
import '../datasources/product/product_remote_data_source.dart';

class ProductRepositoryImpl extends ProductRepository{

  final ProductRemoteDataSource remoteDataSource;

  ProductRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, List<ProductEntity>>> getProducts() async{
    return await remoteDataSource.getProducts();
  }

}