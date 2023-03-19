import 'package:flutter/material.dart';
import 'package:scrubbers_employee_application/common/scheduling/models/scheduling_appointment_entity.dart';
import 'package:scrubbers_employee_application/common/scheduling/scheduling_context_provider.dart';
import 'package:scrubbers_employee_application/features/sidebars/daily_column/presentation/bloc/daily_column_bloc.dart';
import 'package:scrubbers_employee_application/features/sidebars/daily_column/presentation/bloc/daily_column_event.dart';

import '../../../../common/scheduling/calculate_appointment_details.dart';
import '../../../../injection.dart';

onAcceptWithContext(BuildContext context) =>
    (DateTime date, int startHour, int employee) =>
        (DragTargetDetails<SchedulingAppointmentEntity> details) {

          var schedulingContext = SchedulingContextProvider.of(context);
          var data = calculateAppointmentDetails(
              schedulingContext, details, date, startHour, employee);
          sl<DailyColumnBloc>().add(
            DailyColumnEventPatchAppointment(appointment:data)
          );
        };
