

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../error/failures.dart';
import '../../use_case.dart';
import '../entities/client_details.dart';
import '../repositories/client_repository.dart';

class GetClientDetailsParams extends Equatable {
  final int id;

  const GetClientDetailsParams({required this.id});

  @override
  List<Object> get props => [id];
}

class GetClientDetailsUseCase extends UseCase<ClientDetails, GetClientDetailsParams> {
  final ClientRepository repository;

  GetClientDetailsUseCase(this.repository);

  @override
  Future<Either<Failure, ClientDetails>> call(GetClientDetailsParams params) async {
    return await repository.getClientDetails(params.id);
  }
}