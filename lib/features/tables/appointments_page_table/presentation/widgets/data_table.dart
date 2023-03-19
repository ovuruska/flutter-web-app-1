import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:scrubbers_employee_application/common/show_snackbar.dart';

import '../../../../../common/get_it_maybe.dart';
import '../../../../../core/domain/usecases/patch_appointment.dart';
import '../../../../../injection.dart';
import '../../domain/callbacks/deselect_row_callback.dart';
import '../../domain/entities/appointments_table_data_row_entity.dart';
import '../bloc/appointments_page_table_bloc.dart';
import '../bloc/appointments_page_table_event.dart';
import 'pending_appointments_data_source.dart';

class DataTableScreen extends StatelessWidget {
  onApprove(BuildContext context) =>
      (AppointmentsTableDataRowEntity appointment) {
        var content = "Appointment ${appointment.id} will be confirmed.";

        showUndoSnackbar(
            context: context,
            undo: () {},
            commit: () {
              PatchAppointmentParams params = PatchAppointmentParams(
                  appointment.toAppointment().copyWith(status: "Confirmed"));
              var result = getItMaybe<PatchAppointmentUseCase>()?.call(params);
              sl<AppointmentsPageTableBloc>()
                  .add(AppointmentsPageTableEventDeselect());
              getItMaybe<AppointmentsPageTableDeSelectRowCallback>()?.call();
            },
            content: content);
      };

  onDecline(BuildContext context) =>
      (AppointmentsTableDataRowEntity appointment) {
        var content = "Appointment ${appointment.id} will be cancelled.";
        showUndoAlertSnackbar(
            context: context,
            content: content,
            undo: () {},
            commit: () {
              PatchAppointmentParams params = PatchAppointmentParams(
                  appointment.toAppointment().copyWith(status: "Cancelled"));
              var result = getItMaybe<PatchAppointmentUseCase>()?.call(params);
              sl<AppointmentsPageTableBloc>()
                  .add(AppointmentsPageTableEventDeselect());
              getItMaybe<AppointmentsPageTableDeSelectRowCallback>()?.call();
            });
      };

  @override
  Widget build(BuildContext context) {
    final _dtSource = PendingAppointmentsDataSource(
      onApprove: onApprove(context),
      onDecline: onDecline(context),
    );

    return AsyncPaginatedDataTable2(
      source: _dtSource,
      horizontalMargin: 10,
      columnSpacing: 10,
      showFirstLastButtons: true,
      rowsPerPage: 20,
      columns: const [
        DataColumn2(label: Text(""), size: ColumnSize.S),
        DataColumn2(label: Text(""), size: ColumnSize.S),
        DataColumn2(label: Text("Ticket Id"), size: ColumnSize.S),
        DataColumn2(
          label: Text("Date"),
        ),
        DataColumn2(
          label: Text("Time"),
        ),
        DataColumn2(label: Text("Pet Type"), size: ColumnSize.S),
        DataColumn2(label: Text("Service"), size: ColumnSize.S),
        DataColumn2(
          label: Text("Employee"),
        ),
        DataColumn2(
          label: Text("Branch"),
        ),
        DataColumn2(
          label: Text("First Name"),
        ),
        DataColumn2(
          label: Text("Last Name"),
        ),
        DataColumn2(
          label: Text("Email"),
        ),
        DataColumn2(label: Text("Phone Number")),
        DataColumn2(label: Text('Pet Name')),
        DataColumn2(label: Text("Special handling"), size: ColumnSize.S)
      ],
    );
  }
}
