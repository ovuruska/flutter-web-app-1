import 'package:scrubbers_employee_application/features/tables/appointments_page_table/domain/entities/appointments_table_data_row_entity.dart';

import '../../features/sidebars/daily_column/presentation/bloc/daily_column_bloc.dart';
import '../../features/sidebars/daily_column/presentation/bloc/daily_column_event.dart';
import '../../features/tables/appointments_page_table/domain/callbacks/deselect_row_callback.dart';
import '../../features/tables/appointments_page_table/domain/callbacks/select_row_callback.dart';
import '../../injection.dart';

class AppointmentsPageTableSelectRowCallbackImpl
    extends AppointmentsPageTableSelectRowCallback {
  @override
  void call(AppointmentsTableDataRowEntity row) {
    var employeeId = row.employeeId;
    var date = row.start;
    var employeeName = row.employeeName;
    var target = row.id;

    sl<DailyColumnBloc>().add(DailyColumnEventSetTarget(
      target: target,
      employee: employeeId,
      date: date,
      employeeName: employeeName,
    ));
  }
}

class AppointmentsPageTableDeSelectRowCallbackImpl
    extends AppointmentsPageTableDeSelectRowCallback {
  @override
  void call() {
    sl<DailyColumnBloc>().add(DailyColumnEventClearTarget());
  }
}
