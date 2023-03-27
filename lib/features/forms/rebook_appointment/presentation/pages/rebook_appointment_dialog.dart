import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:scrubbers_employee_application/pages/dashboard/controller.dart';

import '../../../../../injection.dart';
import '../../domain/entities/branch_entity.dart';
import '../../domain/entities/employee_entity.dart';
import '../bloc/create_appointment_bloc.dart';
import '../bloc/create_appointment_event.dart';
import '../bloc/create_appointment_state.dart';
import '../widgets/create_appointment_form.dart';

class RebookAppointmentDialog extends StatefulWidget {
  const RebookAppointmentDialog({Key? key, required this.petId, required this.customerId}) : super(key: key);
  final int petId;
  final int customerId;

  @override
  _RebookAppointmentDialogState createState() =>
      _RebookAppointmentDialogState();
}

class _RebookAppointmentDialogState
    extends State<RebookAppointmentDialog> {
  @override
  void initState() {
    super.initState();
    sl<CreateAppointmentBloc>().add(GetBranchesEvent());
  }

  Widget _buildDialog(BuildContext context, List<BranchEntity> branches,
      List<EmployeeEntity> employees) {
    return BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
        child: Dialog(
            child: CreateAppointmentForm(
              onBranchSelected: (branch) {
                if(branch != null) {
                  sl<CreateAppointmentBloc>().add(GetEmployeesEvent( branchId: branch.id));
                }
              },
              onSubmit: (appointment) {
                sl<CreateAppointmentBloc>().add(PostAppointmentEvent(appointment: appointment,sideEffect:(appointment) {
                  dashboardBloc.patchAppointment(appointment);
                  Navigator.of(context).pop();
                }));
              },
          branches: branches,
          employees: employees, customerId: widget.customerId, petId: widget.petId
        )));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateAppointmentBloc, CreateAppointmentBaseState>(
      bloc: sl<CreateAppointmentBloc>(),
        builder: (context, state) {
      if (state is CreateAppointmentState) {
        var branches = state.branches;
        var employees = state.employees;
        return _buildDialog(context, branches,employees);
      } else {
        return SpinKitThreeInOut(
          color: Colors.blue,
          size: 50.0,);
      }

    });
  }
}
