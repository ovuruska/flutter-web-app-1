import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:intl/intl.dart';
import 'package:scrubbers_employee_application/services/auth.dart';

import '../../../domain/entities/appointment_slot_entity.dart';
import '../../../domain/entities/branch_entity.dart';
import '../../../error/failures.dart';
import 'appointment_slot_remote_data_source.dart';
import '../../../domain/entities/employee_entity.dart';

class AppointmentSlotRemoteDataSourceImpl
    extends AppointmentSlotRemoteDataSource {
  @override
  Future<Either<Failure, List<AppointmentSlotEntity>>> getAvailableSlots(
      {required DateTime start,
      List<EmployeeEntity> groomers = const [],
      List<BranchEntity> branches = const [],
      required String service,
      required int duration}) async {
    var formatter = DateFormat('yyyy-MM-dd');
    var response = await SchedulingAuthService.instance.jsonRequest(
      '/api/schedule/slots',
      method: 'POST',
      body: {
        'date': formatter.format(start),
        'groomers': groomers.map((e) => e.id).toList(),
        'branches': branches.map((e) => e.id).toList(),
        'service': service,
        'duration': duration,
      },
    );
    if (response.statusCode == 200) {
      var respString = await response.stream.bytesToString();
      var respJson = jsonDecode(respString);
      List<AppointmentSlotEntity> slots = respJson
          .map<AppointmentSlotEntity>((e) => AppointmentSlotEntity.fromJson(e))
          .toList();
      return Right(respJson
          .map<AppointmentSlotEntity>((e) => AppointmentSlotEntity.fromJson(e))
          .toList());
    } else {
      return Left(ServerFailure());
    }
  }
}
