import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../../core/error/failures.dart';
import '../../../../../core/usecases/use_case.dart';
import '../entities/client_information.dart';
import '../repositories/client_information_repository.dart';

class GetClientInformationParams extends Equatable {
  final int id;

  GetClientInformationParams({required this.id});

  @override
  List<Object> get props => [id];
}

class GetClientInformationUseCase extends UseCase<ClientInformation,GetClientInformationParams>{
  final ClientInformationRepository repository;

  GetClientInformationUseCase(this.repository);

  @override
  Future<Either<Failure, ClientInformation>> call(GetClientInformationParams params) async {
    return await repository.getClientInformation(params.id);

  }

}