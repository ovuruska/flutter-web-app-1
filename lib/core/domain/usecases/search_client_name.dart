

import 'dart:html';

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:scrubbers_employee_application/core/domain/repositories/client_search_repository.dart';
import 'package:scrubbers_employee_application/core/error/failures.dart';

import '../../use_case.dart';
import '../entities/client_entity.dart';

class SearchClientNameParams extends Equatable {
  final String query;

  const SearchClientNameParams({required this.query});

  @override
  List<Object> get props => [query];
}

class SearchClientNameUseCase extends UseCase<List<ClientEntity>,SearchClientNameParams>{
  final ClientSearchRepository repository;

  SearchClientNameUseCase(this.repository);

  @override
  Future<Either<Failure, List<ClientEntity>>> call(SearchClientNameParams params) async {
    return await repository.getSearchResults(params.query);
  }

}