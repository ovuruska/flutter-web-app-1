

import '../entities/appointments_table_data_row_entity.dart';

abstract class SelectRowCallback{
  void call(AppointmentsTableDataRowEntity row);
}