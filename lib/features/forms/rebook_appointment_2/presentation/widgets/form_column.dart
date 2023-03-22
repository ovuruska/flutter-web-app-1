import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scrubbers_employee_application/common/get_it_maybe.dart';
import 'package:scrubbers_employee_application/features/forms/rebook_appointment_2/presentation/widgets/select_service.dart';

import '../../../../../common/quicker/inputs/date_picker.dart';
import '../../../average_service_time/presentation/widgets/service_time.dart';
import '../../../client_autocomplete/presentation/pages/client_autocomplete.dart';
import '../../../multi_branch_select/presentation/pages/branch_select.dart';
import '../../../multi_groomer_select/presentation/pages/groomer_select.dart';
import '../../../multi_product_select/presentation/pages/product_select.dart';
import '../../../select_client_pets/presentation/pages/select_client_pets.dart';
import '../../domain/callbacks/start_date_selected_callback.dart';

class RebookAppointment2FormColumn extends StatelessWidget {
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
        ClientAutocompleteView(),
        Container(height: 16),
        SelectClientPetsView(),
        Container(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 192,
              height: 48,
              child: SelectService(),
            ),
            SizedBox(
              width: 120,
              height: 64,
              child: AverageServiceTime(),
            )
          ],
        ),
        Container(height: 16),
        MultiGroomerSelectView(),
        Container(height: 16),
        MultiProductSelectView(),
        Container(height: 16),
        MultiBranchSelectView(),
        Container(height:32),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
          Text("Available slots",
              style: GoogleFonts.poppins(
                  fontSize: 20,
                  color: const Color(0xFF2D7CB6),
                  fontWeight: FontWeight.w600)),
          QuickerDataPicker(
            onChanged: (date) {
              getItMaybe<StartDateSelectedCallback>()?.call(date);
            },
          ),
        ],),

      ],
    ));
  }
}
