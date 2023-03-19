import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:scrubbers_employee_application/common/get_it_maybe.dart';
import 'package:scrubbers_employee_application/features/tables/appointments_page_table/domain/callbacks/select_row_callback.dart';
import 'package:scrubbers_employee_application/features/tables/appointments_page_table/domain/entities/paginated_appointments.dart';
import 'package:scrubbers_employee_application/features/tables/appointments_page_table/domain/usecases/get_pending_appointments.dart';
import 'package:scrubbers_employee_application/features/tables/appointments_page_table/domain/usecases/get_pending_interval.dart';

import '../../../../../injection.dart';
import '../../domain/entities/appointments_table_data_row_entity.dart';
import '../bloc/appointment_data_bloc.dart';
import '../bloc/appointment_data_event.dart';

class PendingAppointmentsDataSource extends AsyncDataTableSource {
  final AppointmentsTableGetPendingAppointmentsUseCase getPendingAppointments =
      sl<AppointmentsTableGetPendingAppointmentsUseCase>();
  final AppointmentsTableGetPendingIntervalUseCase getPendingInterval =
      sl<AppointmentsTableGetPendingIntervalUseCase>();

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => 0;

  Color _getDataRowColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return Colors.blue;
    }
    //return Colors.green; // Use the default value.
    return Colors.transparent;
  }

  Color _selectedRawColor(Set<MaterialState> states){
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return Colors.blue;
    }
    else{
      return Colors.blueAccent[100]!;
    }
  }

  Text _text(String text) {
    return Text(
      text,
      style: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w400),
    );
  }

  DataRow getDataRow(AppointmentsTableDataRowEntity data) {
    var formatter = new DateFormat('MM/dd/yyyy');
    var hourFormatter = new DateFormat('hh:mm a');
    var apptDate = formatter.format(data.start);
    var apptTime = hourFormatter.format(data.start);
    var nameAndSurname = getNameAndSurname(data.clientName);
    var clientName = nameAndSurname.first;
    var clientSurname = nameAndSurname.last;
    var branchName = data.branchName;

    var selected = sl<AppointmentDataBloc>().state.selected;
    var ifSelected = selected == data.id;

    return DataRow2(
        onTap: () {
          if(selected != null && selected == data.id) {
            sl<AppointmentDataBloc>().add(AppointmentDataEventDeselect());
          } else {
            sl<AppointmentDataBloc>().add(AppointmentDataEventSelect(data.id));
            getItMaybe<AppointmentsPageTableSelectRowCallback>()?.call(data);
          }
        },
        selected: ifSelected,
        color: MaterialStateProperty.resolveWith((ifSelected) ? _selectedRawColor : _getDataRowColor ),
        key: ValueKey(data.id),
        cells: [
          DataCell(Text(data.id.toString())),
          DataCell(Text(apptDate)),
          DataCell(Text(apptTime)),
          DataCell(Text(data.animal)),
          DataCell(Text(data.service)),
          DataCell(Text(data.employeeName)),
          DataCell(Text(branchName)),
          DataCell(Text(clientName)),
          DataCell(Text(clientSurname)),
          DataCell(Text(data.clientEmail)),
          DataCell(Text(data.clientPhone)),
          DataCell(Text(data.petName)),
          DataCell(Text(data.specialHandling.toString())),
        ]);
  }

  List<String> getNameAndSurname(String name) {
    var nameAndSurname = name.split(" ");
    if (nameAndSurname.length > 1) {
      return [nameAndSurname.first, nameAndSurname.last];
    } else if (nameAndSurname.length == 1) {
      return [nameAndSurname.first, ""];
    } else {
      return ["", ""];
    }
  }

  @override
  Future<AsyncRowsResponse> getRows(int offset, int limit) async {
    var params = AppointmentsTableGetPendingIntervalParams(
        start: DateTime.now(), offset: offset, limit: limit, status: 'Pending');
    var response = await getPendingInterval(params);
    var obj =
        response.getOrElse(() => PaginatedAppointments(results: [], count: 0));
    var rows = obj.results.map<DataRow>((e) => getDataRow(e)).toList();
    var count = obj.count;
    return AsyncRowsResponse(
      count,
      rows,
    );
  }
}
