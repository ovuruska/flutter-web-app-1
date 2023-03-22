import 'package:scrubbers_employee_application/features/appointment_schedule/presentation/bloc/schedule_header/schedule_header_event.dart';

import '../../../features/appointment_schedule/presentation/bloc/schedule_header/schedule_header_bloc.dart';
import '../../../features/forms/rebook_appointment_2/domain/callbacks/start_date_selected_callback.dart';
import '../../../injection.dart';

class StartDateSelectedCallbackImpl extends StartDateSelectedCallback {
  @override
  void call(DateTime date) {
    sl<AppointmentScheduleHeaderBloc>()
        .add(AppointmentScheduleHeaderEventSetDate(date: date));
  }
}