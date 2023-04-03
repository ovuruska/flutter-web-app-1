import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scrubbers_employee_application/core/domain/usecases/get_available_branch_slots.dart';
import 'package:scrubbers_employee_application/features/available_branch_slots/bloc/available_branch_slots_event.dart';
import 'package:scrubbers_employee_application/features/available_branch_slots/bloc/available_branch_slots_state.dart';

class AvailableBranchSlotsBloc
    extends Bloc<AvailableBranchSlotsEvent, AvailableBranchSlotsState> {
  GetAvailableBranchSlotsUseCase getDailyAvailableSlots;
  AvailableBranchSlotsBloc(this.getDailyAvailableSlots)
      : super(AvailableBranchSlotsStateInitial()) {
    on<AvailableBranchSlotsEventLoad>((event, emit) {
      emit(AvailableBranchSlotsStateLoaded(slots: event.slots));
    });

    on<AvailableBranchSlotsEventClear>((event, emit) {
      emit(AvailableBranchSlotsStateInitial());
    });
    on<AvailableBranchSlotsEventFetch>((event, emit) async {
      emit(AvailableBranchSlotsStateLoading());
      var params = GetAvailableBranchSlotsParams(
        start: event.start,
        branches: event.branches,
        service: event.service,
        groomers: event.employees,
      );
      final result = await getDailyAvailableSlots(params);
      result.fold(
        (failure) =>
            emit(AvailableBranchSlotsStateError(message: failure.toString())),
        (slots) => emit(AvailableBranchSlotsStateLoaded(slots: slots)),
      );
    });
  }
}
