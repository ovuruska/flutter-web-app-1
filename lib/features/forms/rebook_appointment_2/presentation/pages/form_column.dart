

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scrubbers_employee_application/features/forms/rebook_appointment_2/presentation/widgets/select_service.dart';

import '../../../average_service_time/presentation/widgets/service_time.dart';
import '../../../client_autocomplete/presentation/pages/client_autocomplete.dart';
import '../../../groomer_select/presentation/pages/groomer_select.dart';
import '../../../select_client_pets/presentation/pages/select_client_pets.dart';

class RebookAppointment2View extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal:16,vertical:32 ),
        child:Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Appointment information",style:GoogleFonts.poppins(fontSize: 24,fontWeight: FontWeight.w600)),
        Container(height:16),
        ClientAutocompleteView(),
        Container(height:16),
        SelectClientPetsView(),
        Container(height:16),
        SelectService(initialValue: 'Full Grooming'),
        Container(height:16),
        AverageServiceTime(),
        Container(height:16),
        Expanded(child:GroomerSelectView() )

      ],
    ));
  }

}