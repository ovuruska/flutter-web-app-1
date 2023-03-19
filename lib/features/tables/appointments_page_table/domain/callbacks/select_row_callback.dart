import '../entities/appointments_table_data_row_entity.dart';

abstract class AppointmentsPageTableSelectRowCallback{
  void call(AppointmentsTableDataRowEntity row);
}