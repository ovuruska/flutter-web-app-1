import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:intl/intl.dart';

import '../../../../../core/error/failures.dart';
import '../../../../../services/auth.dart';
import '../../../../../widgets/cards/root/entity.dart';
import '../../domain/repositories/view_appointments_repository.dart';

class Interval {
  final DateTime start;
  final DateTime end;

  Interval(this.start, this.end);
}

class ViewAppointmentsRepositoryImpl extends ViewAppointmentsRepository {

  getInterval() {
    var now = DateTime.now();
    var twoWeeksLater = now.add(Duration(days: 14 + 1));
    return Interval(now,twoWeeksLater);
  }

  @override
  Future<Either<Failure, List<DashboardAppointmentEntity>>>
      getCancelledAppointments() async {

    var interval = getInterval();
    var formatter = new DateFormat('yyyy-MM-dd');
    var start = formatter.format(interval.start);
    var end = formatter.format(interval.end);
    var queryParams = {
      'start__gt': start,
      'start__lt': end,
      'status': 'Cancelled',
    };
    var response = await SchedulingAuthService.instance.request('/api/schedule/appointments',queryParams: queryParams);

    var respString = await response.stream.bytesToString();
    var respJson = jsonDecode(respString);

    if(response.statusCode != 200) {
      return Left(ServerFailure());
    }else{
      var appointmentEntities = respJson.map<DashboardAppointmentEntity>((e) => DashboardAppointmentEntity.fromJson(e)).toList();
      return Right(appointmentEntities);
    }


  }

  @override
  Future<Either<Failure, List<DashboardAppointmentEntity>>>
      getPendingAppointments() async {
    var interval = getInterval();
    var formatter = new DateFormat('yyyy-MM-dd');
    var start = formatter.format(interval.start);
    var end = formatter.format(interval.end);
    var queryParams = {
      'start__gt': start,
      'end__lt': end,
      'status': 'Pending',
    };
    var response = await SchedulingAuthService.instance.request('/api/schedule/appointments',queryParams: queryParams);
    var respString = await response.stream.bytesToString();
    var respJson = jsonDecode(respString) as List;
    if(response.statusCode != 200) {
      return Left(ServerFailure());
    }else{
      var appointmentEntities = respJson.map<DashboardAppointmentEntity>((e) => DashboardAppointmentEntity.fromJson(e)).toList();
      return Right(appointmentEntities);
    }

  }

  @override
  Future<Either<Failure, List<DashboardAppointmentEntity>>>
      getWaitlistAppointments() async {
    var interval = getInterval();
    var formatter = new DateFormat('yyyy-MM-dd');
    var start = formatter.format(interval.start);
    var end = formatter.format(interval.end);
    var queryParams = {
      'start__gt': start,
      'end__lt': end,
      'status': 'Rescheduling',
    };
    var response = await SchedulingAuthService.instance.request('/api/schedule/appointments',queryParams: queryParams);
    var respString = await response.stream.bytesToString();
    var respJson = jsonDecode(respString) as List;
    if(response.statusCode != 200) {
      return Left(ServerFailure());
    }else{
      var appointmentEntities = respJson.map<DashboardAppointmentEntity>((e) => DashboardAppointmentEntity.fromJson(e)).toList();
      return Right(appointmentEntities);
    }


  }
}
