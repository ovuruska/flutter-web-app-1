

import 'package:dartz/dartz.dart';
import 'package:mockito/mockito.dart';
import 'package:scrubbers_employee_application/core/domain/entities/employee_entity.dart';
import 'package:scrubbers_employee_application/core/error/failures.dart';

import 'employee_remote_data_source.dart';

class EmployeeRemoteDataSourceTest implements EmployeeRemoteDataSource {

  final List<EmployeeEntity> employees = [EmployeeEntity(
      id: 1,
      name: "John Doe",
      email: "",
    role: "Full Grooming"
  ),
    EmployeeEntity(id: 2, name: 'Jane Doe', role: 'We Wash'),
    EmployeeEntity(id: 3, name: 'John Smith', role: 'We Wash'),
    EmployeeEntity(id: 4, name: 'Jane Smith', role: 'We Wash'),
    EmployeeEntity(id: 5, name: 'John Vulcan', role: 'We Wash'),
    EmployeeEntity(id: 6, name: 'Jane Vulcan', role: 'Full Grooming'),
    EmployeeEntity(id: 7, name: 'Randall Johns', role: 'Full Grooming'),
    EmployeeEntity(id: 8, name: 'Randall Smith', role: 'Full Grooming'),
    EmployeeEntity(id: 9, name: 'Randall Vulcan', role: 'Full Grooming'),
    EmployeeEntity(id: 10, name: 'Jane Johns', role: 'Full Grooming'),

  ];

  @override
  Future<Either<Failure, void>> delete(int id) {
    return Future.value(Right(null));
  }

  @override
  Future<Either<Failure, EmployeeEntity>> getEmployee(int id) {
    if(id > employees.length  || id < 1){
      return Future.value(Left(ServerFailure()));
    }else{
      return Future.value(Right(employees[id-1]));
    }
  }

  @override
  Future<Either<Failure, List<EmployeeEntity>>> getGroomers() {
    return Future.value(Right(employees.where((element) => element.role == "Full Grooming").toList()));
  }

  @override
  Future<Either<Failure, EmployeeEntity>> patch(EmployeeEntity employee) {
    return Future.value(Right(employee));
  }
}