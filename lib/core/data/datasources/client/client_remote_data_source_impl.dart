import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:intl/intl.dart';
import 'package:scrubbers_employee_application/core/domain/entities/appointment.dart';
import 'package:scrubbers_employee_application/core/domain/entities/client_details.dart';

import '../../../../services/auth.dart';
import '../../../domain/entities/pet_entity.dart';
import '../../../error/failures.dart';
import 'client_remote_data_source.dart';

class ClientRemoteDataSourceImpl extends ClientRemoteDataSource {
  @override
  Future<Either<Failure, List<PetEntity>>> getClientPets(int id) async {
    var response = await SchedulingAuthService.instance
        .request('/api/scheduling/customer/$id/pets');
    var respString = await response.stream.bytesToString();
    var respJson = jsonDecode(respString);
    if (response.statusCode == 200) {
      List<PetEntity> pets =
          respJson.map<PetEntity>((e) => PetEntity.fromJson(e)).toList();
      return Right(pets);
    } else {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, ClientDetails>> getClientDetails(int id) async {
    var response = await SchedulingAuthService.instance
        .request("/api/scheduling/customer/$id");
    if (response.statusCode != 200)
      return Left(ServerFailure());
    else {
      var respString = await response.stream.bytesToString();
      var respJson = jsonDecode(respString);
      var result = ClientDetails.fromJson(respJson);
      return Right(result);
    }
  }

  @override
  Future<Either<Failure, List<AppointmentEntity>>> getPriorAppointments(
      int id) async {
    var formatter = DateFormat('yyyy-MM-dd');
    var date = DateTime.now();
    var formattedDate = formatter.format(date);

    var queryParams = {
      "customer": id.toString(),
      "start__lt": formattedDate,
    };
    var response = await SchedulingAuthService.instance
        .request("/api/schedule/appointments", queryParams: queryParams);

    if (response.statusCode == 200) {
      var respString = await response.stream.bytesToString();
      var respJson = jsonDecode(respString);
      return Right(respJson
          .map<AppointmentEntity>((e) => AppointmentEntity.fromJson(e))
          .toList());
    } else {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<AppointmentEntity>>> getUpcomingAppointments(
      int id) async {
    var formatter = DateFormat('yyyy-MM-dd');
    var date = DateTime.now();
    var formattedDate = formatter.format(date);

    var queryParams = {
      "customer": id.toString(),
      "start__gt": formattedDate,
    };
    var response = await SchedulingAuthService.instance
        .request("/api/schedule/appointments", queryParams: queryParams);

    if (response.statusCode == 200) {
      var respString = await response.stream.bytesToString();
      var respJson = jsonDecode(respString);
      return Right(respJson
          .map<AppointmentEntity>((e) => AppointmentEntity.fromJson(e))
          .toList());
    } else {
      return Left(ServerFailure());
    }
  }
}
