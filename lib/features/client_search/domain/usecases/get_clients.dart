

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:scrubbers_employee_application/features/client_search/domain/repositories/client_search_repository.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/use_case.dart';
import '../entities/client_search_entity.dart';

class GetClientsParams extends Equatable {
  final String query;

  GetClientsParams({required this.query});

  @override
  List<Object> get props => [query];
}

class GetClientsUseCase extends UseCase<List<ClientSearchEntity>, GetClientsParams> {
  final ClientSearchRepository repository;

  GetClientsUseCase(this.repository);

  @override
  Future<Either<Failure, List<ClientSearchEntity>>> call(GetClientsParams params) async {
    return await repository.getClientSearchResults(params.query);
  }
}