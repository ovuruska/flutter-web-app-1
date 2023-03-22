import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scrubbers_employee_application/common/get_it_maybe.dart';
import 'package:scrubbers_employee_application/features/available_slots/presentation/blocs/available_slots_event.dart';
import 'package:scrubbers_employee_application/features/forms/rebook_appointment_2/presentation/widgets/select_service.dart';

import '../../../../../common/quicker/inputs/date_picker.dart';
import '../../../../../injection.dart';
import '../../../../available_slots/presentation/blocs/available_slots_bloc.dart';
import '../../../../available_slots/presentation/pages/available_slots.dart';
import '../../../average_service_time/presentation/widgets/service_time.dart';
import '../../../client_autocomplete/presentation/pages/client_autocomplete.dart';
import '../../../multi_branch_select/presentation/pages/branch_select.dart';
import '../../../multi_groomer_select/presentation/pages/groomer_select.dart';
import '../../../multi_product_select/presentation/pages/product_select.dart';
import '../../../select_client_pets/presentation/pages/select_client_pets.dart';
import '../../domain/callbacks/start_date_selected_callback.dart';
import 'rebook_context.dart';
import 'rebook_context_provider.dart';

class RebookAppointment2FormColumn extends StatelessWidget {
  late RebookContext rebookContext;
  RebookAppointment2FormColumn({Key? key}) : super(key: key){
    rebookContext = RebookContext(
      startDate:DateTime.now(),
      groomers: [],
      branches: [],
      service: "Full Grooming",
      duration: 60,
    );
  }

  getAvailableSlots(RebookContext rebookContext)  {

    sl<AvailableSlotsBloc>().add(
      AvailableSlotsEventFetch(
        start: rebookContext.startDate,
        groomers: rebookContext.groomers,
        branches: rebookContext.branches,
        service: rebookContext.service!,
        duration: rebookContext.duration!,
    ));

  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Appointment information",
            style: GoogleFonts.poppins(
                fontSize: 20,
                color: const Color(0xFF2D7CB6),
                fontWeight: FontWeight.w600)),
        Container(height: 16),
        ClientAutocompleteView(
          key: Key('client_autocomplete'),
          onSelected: (value) {
            rebookContext.setClient(value);

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
                onChanged: (value) {
                  getAvailableSlots(rebookContext.setService(value));
                },
              ),
            ),
            SizedBox(
              width: 120,
              height: 64,
              child: AverageServiceTime(
                onChanged: (value) {
                  getAvailableSlots(rebookContext.setDuration(value));
                },
              ),
            )

          ],
        ),
        Container(height: 16),
        MultiGroomerSelectView(
          onSelected: (value) {
            getAvailableSlots(rebookContext.setGroomers(value));
          },
        ),
        Container(height: 16),
        MultiProductSelectView(
          onSelected: (value) {
            rebookContext.setProducts(value);
          },
        ),
        Container(height: 16),
        MultiBranchSelectView(
          onSelected: (value) {
            getAvailableSlots(rebookContext.setBranches(value));
          },
        ),
        Container(height: 32),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Available slots",
                style: GoogleFonts.poppins(
                    fontSize: 20,
                    color: const Color(0xFF2D7CB6),
                    fontWeight: FontWeight.w600)),
            QuickerDatePicker(
              onChanged: (value) {
                getAvailableSlots(rebookContext.setStartDate(value));
              },
            ),
          ],
        ),
        SizedBox(
            height:360,
            child: RebookContextProvider(
          notifier: rebookContext,
          child: AvailableSlotsView(),
        ))

      ],
    ));
  }
}
