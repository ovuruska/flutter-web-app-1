import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/usecases/use_case.dart';
import '../../domain/use_cases/get_cancelled_appointments.dart';
import '../../domain/use_cases/get_pending_appointments.dart';
import '../../domain/use_cases/get_waitlist_appointments.dart';
import 'view_appointments_event.dart';
import 'view_appointments_state.dart';

class ViewAppointmentsBloc
    extends Bloc<ViewAppointmentsEvent, ViewAppointmentsState> {
  final GetCancelledAppointmentsUseCase getCancelledAppointments;
  final GetPendingAppointmentsUseCase getPendingAppointments;
  final GetWaitlistAppointmentsUseCase getWaitlistAppointments;

  ViewAppointmentsBloc(
      {required this.getCancelledAppointments, required this.getPendingAppointments, required this.getWaitlistAppointments,})
      : super(Initial()){
  on<GetCancelledAppointmentsEvent>((event, emit) async {
    final result = await getCancelledAppointments(NoParams());
    if(state is Loaded){
      emit((state as Loaded).setCancelledAppointments(result.getOrElse(() => [])));
    } else {
      var cancelledAppointments = result.getOrElse(() => []);
      emit(Loaded(cancelledAppointments: cancelledAppointments));
    }

  });
  on<GetWaitlistAppointmentsEvent>((event, emit) async {
    final result = await getWaitlistAppointments(NoParams());
    if(state is Loaded){
      emit((state as Loaded).setWaitlistAppointments(result.getOrElse(() => [])));
    } else {
      emit(Loaded(waitlistAppointments: result.getOrElse(() => [])));
    }
  });
  on<GetPendingAppointmentsEvent>((event, emit) async {
    final result = await getPendingAppointments(NoParams());
    if(state is Loaded){
      emit((state as Loaded).setPendingAppointments(result.getOrElse(() => [])));
    } else {
      emit(Loaded(pendingAppointments: result.getOrElse(() => [])));
    }
  });

  on<RemoveWaitlistAppointmentEvent>((event,emit) async {
    if(state is Loaded){
      var waitlistAppointments = (state as Loaded).waitlistAppointments;
      waitlistAppointments = waitlistAppointments.where((element) => element.id != event.appointment).toList();
      var newState = (state as Loaded).setWaitlistAppointments(waitlistAppointments);
      emit(newState);
    }
  });
  }
}