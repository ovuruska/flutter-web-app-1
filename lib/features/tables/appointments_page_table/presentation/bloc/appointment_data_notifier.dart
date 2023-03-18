import 'package:flutter/foundation.dart';

import '../../domain/entities/appointments_table_data_row_entity.dart';
import '../../domain/usecases/get_pending_appointments.dart';

class AppointmentDataNotifier with ChangeNotifier{

  final AppointmentsTableGetPendingAppointmentsUseCase getPendingAppointments;

  AppointmentDataNotifier(this.getPendingAppointments);

  List<AppointmentsTableDataRowEntity> get appointments => _appointments;
  List<AppointmentsTableDataRowEntity> _appointments = [];




}