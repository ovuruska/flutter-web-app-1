import 'package:flutter/material.dart';
import 'package:scrubbers_employee_application/features/tables/appointments_page_table/domain/usecases/get_pending_appointments.dart';

import '../../../../../injection.dart';
import '../../domain/entities/paginated_appointments.dart';
import '../widgets/data_table.dart';

class AppointmentPagesTableView extends StatefulWidget {

  @override
  _AppointmentPagesTableViewState createState() =>
      _AppointmentPagesTableViewState();
}

class _AppointmentPagesTableViewState extends State<AppointmentPagesTableView> {

  PaginatedAppointments? _initial;

  @override
  void initState() {
    super.initState();
    var params = AppointmentsTableGetPendingAppointmentsParams(
        status: "Pending", start: DateTime.now());
    sl<AppointmentsTableGetPendingAppointmentsUseCase>().call(params).then((
        value) =>
        value.fold((l) => print(l), (r) =>
            setState(() {
              _initial = r;
            })));
  }

  @override
  Widget build(BuildContext context) {
    if (_initial != null) {
      return Scaffold(
        body: DataTableScreen(data: _initial!,),);
    }else{
      return Scaffold(body: Center(child: CircularProgressIndicator(),),);
    }
  }
}