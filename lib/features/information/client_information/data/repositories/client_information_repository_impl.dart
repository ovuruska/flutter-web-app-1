import 'dart:convert' show jsonDecode;
import 'package:dartz/dartz.dart';
import 'package:scrubbers_employee_application/core/error/failures.dart';
import 'package:scrubbers_employee_application/services/auth.dart';

import '../../domain/entities/client_information.dart';
import '../../domain/repositories/client_information_repository.dart';

class ClientInformationRepositoryImpl extends ClientInformationRepository{
  @override
  Future<Either<Failure, ClientInformation>> getClientInformation(int id )  async {
    var response = await SchedulingAuthService.instance.request(
      '/api/scheduling/customer/$id',
      method: 'GET',

    );
    var respString = await response.stream.bytesToString();
    var respJson = jsonDecode(respString);
    if (response.statusCode == 200) {
      return Right(ClientInformation.fromJson(respJson));
    }else{
      return Left(ServerFailure());
    }
  }

}