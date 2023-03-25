

import 'dart:math';

import 'package:dartz/dartz.dart';

import '../../../error/failures.dart';
import 'analytics_pet_remote_data_source.dart';

class AnalyticsPetRemoteDataSourceTest extends AnalyticsPetRemoteDataSource {
  final random = Random();
  final values = [
    15, 30, 45, 60, 75, 90, 105, 120, 135, 150, 165, 180,
  ];
  @override
  Future<Either<Failure, double>> averageServiceTime(int id) async {

    final serviceTime = values[random.nextInt(values.length)];
    return Future.value(Right(serviceTime.toDouble()));
  }
}