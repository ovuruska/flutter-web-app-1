import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scrubbers_employee_application/core/domain/entities/branch_entity.dart';
import 'package:scrubbers_employee_application/core/domain/entities/employee_entity.dart';
import 'package:scrubbers_employee_application/features/available_slots/presentation/blocs/available_slots_bloc.dart';
import 'package:scrubbers_employee_application/features/available_slots/presentation/blocs/available_slots_event.dart';
import 'package:scrubbers_employee_application/features/forms/rebook_appointment_2/presentation/widgets/partial_card_factory.dart';
import 'package:scrubbers_employee_application/features/forms/rebook_appointment_2/presentation/widgets/select_service.dart';
import 'package:scrubbers_employee_application/features/forms/select_client_pets/presentation/bloc/select_client_pets_bloc.dart';
import 'package:scrubbers_employee_application/features/forms/select_client_pets/presentation/bloc/select_client_pets_event.dart';

import '../../../../../common/quicker/inputs/date_picker.dart';
import '../../../../../core/domain/entities/client_entity.dart';
import '../../../../available_slots/presentation/pages/available_slots.dart';
import '../../../average_service_time/presentation/widgets/service_time.dart';
import '../../../client_autocomplete/presentation/pages/client_autocomplete.dart';
import '../../../multi_branch_select/presentation/pages/branch_select.dart';
import '../../../multi_groomer_select/presentation/pages/groomer_select.dart';
import '../../../multi_product_select/presentation/pages/product_select.dart';
import '../../../select_client_pets/presentation/pages/select_client_pets.dart';
import '../../../../../injection.dart';
import 'rebook_context.dart';
import 'rebook_context_provider.dart';

class RebookAppointment2FormColumn extends StatelessWidget {
  late RebookContext rebookContext;
  final List<EmployeeEntity> groomers;
  final List<BranchEntity> branches;
  final String service;
  final int duration;
  final DateTime? startDate;
  final ClientEntity? client;
  RebookAppointment2FormColumn({
    Key? key,
    this.groomers = const [],
    this.branches = const [],
    this.service = 'Full Grooming',
    this.duration = 60,
    this.startDate,
    this.client,
  }) : super(key: key) {
    rebookContext = RebookContext(
      client: client,
      startDate: startDate ?? DateTime.now(),
      groomers: groomers,
      branches: branches,
      service: service,
      duration: duration,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      ExpandableNotifier(
          initialExpanded: true,
          child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Appointment information",
                    style: GoogleFonts.poppins(
                        fontSize: 20,
                        color: const Color(0xFF2D7CB6),
                        fontWeight: FontWeight.w600)),
                Builder(
                  builder: (context) {
                    var controller = ExpandableController.of(context)!;
                    return IconButton(
                      icon: Icon(
                        controller.expanded
                            ? Icons.arrow_drop_up
                            : Icons.arrow_drop_down,
                        size: 30,
                        color: const Color(0xFF2D7CB6),
                      ),
                      onPressed: () {
                        controller.toggle();
                      },
                    );
                  },
                ),
              ],
            ),
            ExpandablePanel(
              header: null,
              expanded: Column(
                children: [
                  Container(height: 16),
                  ClientAutocompleteView(
                    initialValue: rebookContext.client,
                    onSelected: (value) {
                      rebookContext.setClient(value);
                      rebookContext.setPet(null);
                      sl<SelectClientPetsBloc>().add(
                        SelectClientPetsEventCleared(),
                      );
                      sl<SelectClientPetsBloc>().add(
                        SelectClientPetsEventFetchClientPets(id: value.id),
                      );
                    },
                  ),
                  Container(height: 16),
                  SelectClientPetsView(
                    onChanged: (value) {
                      rebookContext.setPet(value);
                    },
                  ),
                  Container(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 192,
                        height: 48,
                        child: SelectService(
                          initialValue: rebookContext.service,
                          onChanged: (value) {
                            rebookContext.setService(value);
                          },
                        ),
                      ),
                      SizedBox(
                        width: 120,
                        height: 64,
                        child: AverageServiceTime(
                          onChanged: (value) {
                            rebookContext.setDuration(value);
                          },
                        ),
                      )
                    ],
                  ),
                ],
              ),
              collapsed: Container(),
            )
          ])),
      Container(height: 32),
      Text("Drag and Drop to rebook",
          style: GoogleFonts.poppins(
              fontSize: 20,
              color: const Color(0xFF2D7CB6),
              fontWeight: FontWeight.w600)),
      Container(height: 16),
      RebookContextProvider(
          notifier: rebookContext, child: PartialCardFactory()),
      Container(height: 32),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("Available slots",
              style: GoogleFonts.poppins(
                  fontSize: 20,
                  color: const Color(0xFF2D7CB6),
                  fontWeight: FontWeight.w600)),
          Row(
            children: [
              Text("starting from",
                  style: GoogleFonts.poppins(
                      fontSize: 12,
                      color: Colors.grey,
                      fontWeight: FontWeight.w600)),
              Container(width: 4),
              QuickerDatePicker(
                onChanged: (value) {
                  rebookContext.setStartDate(value);
                },
              ),
            ],
          )
        ],
      ),
      Container(height: 16),
      MultiGroomerSelectView(
        onSelected: (value) {
          rebookContext.setGroomers(value);
          sl<AvailableSlotsBloc>().add(
            AvailableSlotsEventFetch(
              start: rebookContext.startDate,
              groomers: rebookContext.groomers,
              branches: rebookContext.branches,
              service: rebookContext.service ?? "Full Grooming",
              duration: rebookContext.duration ?? 60,
            ),
          );
        },
      ),
      // Container with width 16

      Container(height: 16),
      MultiProductSelectView(
        onSelected: (value) {
          rebookContext.setProducts(value);
        },
      ),

      Container(height: 16),
      MultiBranchSelectView(
        onSelected: (value) {
          rebookContext.setBranches(value);
          sl<AvailableSlotsBloc>().add(
            AvailableSlotsEventFetch(
              start: rebookContext.startDate,
              groomers: rebookContext.groomers,
              branches: rebookContext.branches,
              service: rebookContext.service ?? "Full Grooming",
              duration: rebookContext.duration ?? 60,
            ),
          );
        },
      ),
      SizedBox(
        height: 360,
        child: AvailableSlotsView(),
      ),
      Container(height: 32),
    ]));
  }
}
