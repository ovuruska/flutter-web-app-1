import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scrubbers_employee_application/core/domain/entities/interval.dart';

import '../../../../../core/domain/usecases/clear_working_hours.dart';
import '../../../../../core/domain/usecases/get_working_hours.dart';
import '../../../../../core/domain/usecases/upsert_working_hours.dart';
import 'branch_working_hours_event.dart';
import 'branch_working_hours_state.dart';



class BranchWorkingHoursBloc
    extends Bloc<BranchWorkingHoursEvent, BranchWorkingHoursState> {
  final GetWorkingHoursUseCase getWorkingHours;
  final ClearWorkingHoursUseCase clearWorkingHours;
  final UpsertWorkingHoursUseCase upsertWorkingHours;

  BranchWorkingHoursBloc({
    required this.clearWorkingHours,
    required this.upsertWorkingHours,
    required this.getWorkingHours,
  }) : super(BranchWorkingHoursStateEmpty()) {
    on<BranchWorkingHoursEventGet>((event, emit) async {
      emit(BranchWorkingHoursStateLoading());
      var employeeId = event.id;
      var interval = event.interval;

      var params = GetWorkingHoursParams(id: employeeId, interval: interval);
      var failureOrWorkingHours = await getWorkingHours(params);
      failureOrWorkingHours.fold(
          (failure) => emit(BranchWorkingHoursStateFailed(message: "Failed to get working hours.")),
          (workingHours) => emit(BranchWorkingHoursStateLoaded(workingHours: workingHours,id:employeeId)));
    });


    on<BranchWorkingHoursEventUpsert>((event,emit) async {
      var workingHours = event.workingHours;
      var branchId = event.id;
      var params = UpsertWorkingHoursParams(id:branchId,workingHours: workingHours);
      var failureOrWorkingHours = await upsertWorkingHours(params);
    });
    on<BranchWorkingHoursEventSetBranch>((event, emit) async {
      emit(BranchWorkingHoursStateLoading());
      var employeeId = event.id;

      var now = DateTime.now();
      var monday = now.subtract(Duration(days: now.weekday - 1));
      var nextMonday = monday.add(Duration(days: 7));
      var interval = IntervalEntity(start: monday, end: nextMonday);
      var params = GetWorkingHoursParams(id: event.id, interval: interval);

      var failureOrWorkingHours = await getWorkingHours(params);
      failureOrWorkingHours.fold(
          (failure) => emit(BranchWorkingHoursStateFailed(message: "Failed to get working hours.")),
          (workingHours) => emit(BranchWorkingHoursStateLoaded(workingHours: workingHours,id:employeeId)));
    });

    on<BranchWorkingHoursEventClear>((event,emit) async {
      var employeeId = event.id;
      var now = DateTime.now();
      var monday = now.subtract(Duration(days: now.weekday - 1));
      var nextMonday = monday.add(Duration(days: 7));
      var interval = IntervalEntity(start: monday, end: nextMonday);
      var params = ClearWorkingHoursParams(id: employeeId, interval: interval);
      await clearWorkingHours.call(params);
      emit(BranchWorkingHoursStateInitial(id: employeeId));

    });

    on<BranchWorkingHoursEventPurge>((event,emit) async {
      emit(BranchWorkingHoursStateEmpty());
    });
  }
}
