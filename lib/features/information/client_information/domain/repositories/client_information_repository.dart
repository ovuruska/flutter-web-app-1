import 'package:dartz/dartz.dart';

import '../../../../../core/error/failures.dart';
import '../entities/client_information.dart';

abstract class ClientInformationRepository {
  Future<Either<Failure, ClientInformation>> getClientInformation(int id );
}