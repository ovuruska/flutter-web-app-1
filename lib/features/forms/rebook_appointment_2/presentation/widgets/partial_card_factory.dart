import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scrubbers_employee_application/common/scheduling/models/scheduling_appointment_entity.dart';
import 'package:scrubbers_employee_application/features/app_select_branch/presentation/widgets/app_select_branch.dart';
import 'package:scrubbers_employee_application/features/appointment_schedule/domain/entities/creatable_scheduling_appointment_entity.dart';

import '../../../../../common/scheduling/cards/root/partial.dart';
import '../../../../../core/domain/entities/appointment_local.dart';
import '../../../../../injection.dart';
import '../../../../app_select_branch/presentation/bloc/app_select_branch_bloc.dart';
import '../../../../app_select_branch/presentation/bloc/app_select_branch_state.dart';
import 'rebook_context.dart';
import 'rebook_context_provider.dart';

class PartialCardFactory extends StatelessWidget {
  AppointmentEntityLocal createAppointmentEntity(
      RebookContext rebookContext, int employee) {
    var branch =
        (sl<AppSelectBranchBloc>().state as AppSelectBranchStateLoaded).branch!;
    var start = DateTime.now();
    var end = start.add(Duration(minutes: 60));
    var customerId = rebookContext.client!.id;
    var petId = rebookContext.pet!.id;
    var products = rebookContext.products!.map((e) => e.id).toList();
    var branchId = branch.id;
    // Branch, customer, products, pet, service will be provided.

    var appointmentEntityLocal = AppointmentEntityLocal(
      customer: customerId,
      pet: petId,
      start: start,
      end: end,
      branch: branchId,
      employee: employee,
      products: products,
      service: rebookContext.service!,
    );

    return appointmentEntityLocal;
  }

  Widget _valid(RebookContext rebookContext) {
    var branch =
        (sl<AppSelectBranchBloc>().state as AppSelectBranchStateLoaded).branch!;
    var customerId = rebookContext.client!.id;
    var customerName = rebookContext.client!.name;
    var dogId = rebookContext.pet!.id;
    var dogName = rebookContext.pet!.name;
    var breed = rebookContext.pet!.breed;
    var service = rebookContext.service!;
    var specialHandling = rebookContext.pet!.specialHandling;
    var productIds = rebookContext.products.map((e) => e.id).toList();
    var start = DateTime.now();
    var end = start.add(Duration(minutes: 60));

    var schedulingAppointmentEntity = CreatableSchedulingAppointmentEntity(
        id: -1,
        status: 'Pending',
        customerId: customerId,
        dogId: dogId,
        customerName: customerName,
        employee: -1,
        employeeName: "",
        service: service,
        breed: breed,
        dogName: dogName,
        start: start,
        end: end,
        invoice: 0,
        specialHandling: specialHandling,
        branch: branch.id,
        products: productIds,
        branchName: branch.name);

    var child = AppointmentCardPartial(
      width: 240,
      height: 120,
      customerName: rebookContext.client?.name,
      dogName: rebookContext.pet?.name,
      service: rebookContext.service,
      specialHandling: rebookContext.pet?.specialHandling,
      breed: rebookContext.pet?.breed,
    );

    return Draggable<CreatableSchedulingAppointmentEntity>(
        data: schedulingAppointmentEntity,
        feedback: Opacity(
          child: child,
          opacity: .5,
        ),
        child: child);
  }

  bool isValid(RebookContext rebookContext) {
    return rebookContext.client != null &&
        rebookContext.pet != null &&
        rebookContext.service != null;
  }

  final invalid = const Color(0xFFFFF4F4);
  final valid = const Color(0xFFFBFDF7);

  @override
  Widget build(BuildContext context) {
    var rebookContext = RebookContextProvider.of(context).notifier!;
    return BlocBuilder<AppSelectBranchBloc, AppSelectBranchState>(
      bloc: sl<AppSelectBranchBloc>(),
      builder: (context, state) {
        if (isValid(rebookContext)) {
          return Container(
              decoration: BoxDecoration(
                  color: const Color(0xFFFBFDF7),
                  borderRadius: BorderRadius.circular(8)),
              height: 192,
              width: 360,
              child: Center(
                  child: MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: _valid(rebookContext))));
        } else {
          return Container(
              decoration: BoxDecoration(
                  color: const Color(0xFFFFF4F4),
                  borderRadius: BorderRadius.circular(8)),
              height: 192,
              width: 360,
              child: Center(
                  child: MouseRegion(
                      child: GestureDetector(
                          child: _invalid(rebookContext)))));
        }
      },
    );
  }

  Widget _invalid(RebookContext rebookContext) {
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
