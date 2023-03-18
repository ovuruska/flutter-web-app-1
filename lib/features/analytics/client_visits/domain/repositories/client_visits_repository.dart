import 'package:dartz/dartz.dart';

import '../../../../../core/error/failures.dart';


abstract class ClientVisitsRepository{
  Future<Either<Failure, Map<String,double>>> get(int id);
}