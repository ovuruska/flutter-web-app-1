

import 'dart:convert';

import 'package:dartz/dartz.dart';

import 'package:scrubbers_employee_application/core/domain/entities/product_entity.dart';

import 'package:scrubbers_employee_application/core/error/failures.dart';
import 'package:scrubbers_employee_application/services/auth.dart';

import 'product_remote_data_source.dart';

class ProductRemoteDataSourceImpl extends ProductRemoteDataSource {
  @override
  Future<Either<Failure, List<ProductEntity>>> getProducts() async {
    var response = await SchedulingAuthService.instance.request(
      '/api/products/all',
      method: 'GET'
    );

    if (response.statusCode == 200) {
      var respString = await response.stream.bytesToString();
      var respJson = jsonDecode(respString);
      List<ProductEntity> products = respJson.map<ProductEntity>((e) => ProductEntity.fromJson(e)).toList();
      return Right(products);
    } else {
      return Left(ServerFailure());
    }
  }

}