

import 'package:dartz/dartz.dart';

import 'package:scrubbers_employee_application/core/domain/entities/client_entity.dart';

import 'package:scrubbers_employee_application/core/error/failures.dart';

import 'client_search_remote_data_source.dart';

class ClientSearchRemoteDataSourceTest extends ClientSearchRemoteDataSource{
  @override
  Future<Either<Failure, List<ClientEntity>>> getSearchResults(String query, {int page = 1}) {
    final clients = [
      ClientEntity(
          id: 1,
          name: 'James Vardy',
          email: '',
          phone: '',
          address: ''
      ),
      ClientEntity(
          id: 2,
          name: 'Maio Icardy',
          email: '',
          phone: '',
          address: ''
      ),
      ClientEntity(
          id: 3,
          name: 'James Icardy',
          email: '',
          phone: '',
          address: ''
      ),
      ClientEntity(
          id: 4,
          name: 'Maio Vardy',
          email: '',
          phone: '',
          address: ''
      ),
      ClientEntity(
          id: 5,
          name: 'James Johnson',
          email: '',
          phone: '',
          address: ''
      ),
      ClientEntity(
          id: 6,
          name: 'Maio Johnson',
          email: '',
          phone: '',
          address: ''
      ),

    ];
    return Future.value(Right(clients));
  }

}