import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scrubbers_employee_application/features/forms/rebook_appointment_2/presentation/widgets/select_service.dart';

import '../../../average_service_time/presentation/widgets/service_time.dart';
import '../../../branch_select/presentation/pages/branch_select.dart';
import '../../../client_autocomplete/presentation/pages/client_autocomplete.dart';
import '../../../groomer_select/presentation/pages/groomer_select.dart';
import '../../../product_select/presentation/pages/product_select.dart';
import '../../../select_client_pets/presentation/pages/select_client_pets.dart';

class RebookAppointment2FormColumn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
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
        Container(height: 32),
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
        GroomerSelectView(),
        Container(height: 16),
        ProductSelectView(),
        Container(height: 16),
        BranchSelectView(),
      ],
    );
  }
}
