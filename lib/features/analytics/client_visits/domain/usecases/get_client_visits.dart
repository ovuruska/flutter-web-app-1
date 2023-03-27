import 'package:dartz/dartz.dart';

import '../../../../../core/error/failures.dart';
import '../../../../../core/use_case.dart';
import '../repositories/client_visits_repository.dart';

class GetClientVisitsUseCase extends UseCase<Map<String, double>, int> {
  final ClientVisitsRepository repository;

  GetClientVisitsUseCase(this.repository);

  @override
  Future<Either<Failure, Map<String, double>>> call(int id) async {
    return await repository.get(id);
  }
}