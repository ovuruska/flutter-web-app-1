import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/domain/entities/appointment_slot_entity.dart';
import '../../../../core/domain/usecases/get_available_slots.dart';
import 'available_slots_event.dart';
import 'available_slots_state.dart';

class AvailableSlotsBloc
    extends Bloc<AvailableSlotsEvent, AvailableSlotsState> {
  final GetAvailableSlotsUseCase getAvailableSlots;
  AvailableSlotsBloc(this.getAvailableSlots)
      : super(AvailableSlotsStateInitial()) {
    on<AvailableSlotsEventFetch>((event, emit) async {
      emit(AvailableSlotsStateLoading());
      var params = GetAvailableSlotsParams(
        start: event.start,
        groomers: event.groomers,
        branches: event.branches,
        service: event.service,
        duration: event.duration,
      );
      var result = await getAvailableSlots(params);
      List<AppointmentSlotEntity> slots =
          result.getOrElse(() => <AppointmentSlotEntity>[]);
      emit(AvailableSlotsStateLoaded(slots: slots));
    });
  }
}
