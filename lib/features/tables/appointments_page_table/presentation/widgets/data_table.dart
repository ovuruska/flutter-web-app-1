import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../domain/entities/paginated_appointments.dart';
import '../bloc/appointment_data_notifier.dart';
import 'pending_appointments_data_source.dart';

class DataTableScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {


    final _dtSource = PendingAppointmentsDataSource();


    return AsyncPaginatedDataTable2(

      source: _dtSource,
      horizontalMargin: 10,
      columnSpacing: 10,
      showFirstLastButtons: true,
      rowsPerPage: PaginatedDataTable.defaultRowsPerPage,
      columns: const [
        DataColumn2(label: Text("Ticket Id"),size: ColumnSize.S),
        DataColumn2(label: Text("Date"),),
        DataColumn2(label: Text("Time"),),
        DataColumn2(label: Text("Pet Type"),size: ColumnSize.S),
        DataColumn2(label: Text("Service"),size: ColumnSize.S),
        DataColumn2(label: Text("Employee"),),
        DataColumn2(label: Text("Branch"),),
        DataColumn2(label: Text("First Name"),),
        DataColumn2(label: Text("Last Name"),),
        DataColumn2(label: Text("Email"),),
        DataColumn2(label: Text("Phone Number")),
        DataColumn2(label: Text('Pet Name')),
        DataColumn2(label: Text("Special handling"),size: ColumnSize.S)
      ],
    );
  }
}
