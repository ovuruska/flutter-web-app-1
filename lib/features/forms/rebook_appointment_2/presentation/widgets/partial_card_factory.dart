import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scrubbers_employee_application/common/scheduling/models/scheduling_appointment_entity.dart';
import 'package:scrubbers_employee_application/features/app_select_branch/presentation/widgets/app_select_branch.dart';

import '../../../../../common/scheduling/cards/root/partial.dart';
import '../../../../../injection.dart';
import '../../../../app_select_branch/presentation/bloc/app_select_branch_bloc.dart';
import '../../../../app_select_branch/presentation/bloc/app_select_branch_state.dart';
import 'rebook_context.dart';
import 'rebook_context_provider.dart';

class PartialCardFactory extends StatelessWidget {
  /*

  Widget _valid(RebookContext rebookContext) {
    var branch = (sl<AppSelectBranchBloc>().state as AppSelectBranchStateLoaded).branch;
    var appointmentEntity = SchedulingAppointmentEntity(id: id, status: status, customerName: customerName, employee: employee, service: service, breed: breed, dogName: dogName, start: start, employeeName: employeeName, end: end, invoice: invoice, specialHandling: specialHandling, branch: branch, branchName: branchName);
    var child = AppointmentCardPartial(
      width: 240,
      height: 120,
      customerName: rebookContext.client?.name,
      dogName: rebookContext.pet?.name,
      service: rebookContext.service,
      specialHandling: rebookContext.pet?.specialHandling,
      breed: rebookContext.pet?.breed,
    );

    return Draggable<SchedulingAppointmentEntity>(
      data: appointmentEntity,
        feedback: Opacity(child:child, opacity: .5,),
        child:child);
  }



  bool isValid(RebookContext rebookContext) {
    return rebookContext.client != null &&
        rebookContext.pet != null &&
        rebookContext.service != null;
  }

  @override
  Widget build(BuildContext context) {
    var rebookContext = RebookContextProvider.of(context).notifier!;
    return BlocBuilder<AppSelectBranchBloc, AppSelectBranchState>(
      bloc: sl<AppSelectBranchBloc>(),
      builder: (context, state) {
        if (isValid(rebookContext)) {
          return MouseRegion(
              cursor: SystemMouseCursors.click, child: _valid(rebookContext));
        } else {
          return MouseRegion(
              cursor: SystemMouseCursors.click, child: _invalid(rebookContext));
        }
      },
    );


  }

     */

  Widget build(BuildContext context) {
    var rebookContext = RebookContextProvider.of(context).notifier!;
    return AppointmentCardPartial(
      width: 240,
      height: 120,
      customerName: rebookContext.client?.name,
      dogName: rebookContext.pet?.name,
      service: rebookContext.service,
      specialHandling: rebookContext.pet?.specialHandling,
      breed: rebookContext.pet?.breed,
    );
  }
}
