import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/interval_entity.dart';
import '../../domain/usecases/clear_working_hours.dart';
import '../../domain/usecases/get_working_hours.dart';
import '../../domain/usecases/upsert_working_hours.dart';
import 'working_hours_event.dart';
import 'working_hours_state.dart';



class EmployeeWorkingHoursBloc
    extends Bloc<EmployeeWorkingHoursEvent, EmployeeWorkingHoursState> {
  final GetWorkingHoursUseCase getWorkingHours;
  final ClearWorkingHoursUseCase clearWorkingHours;
  final UpsertWorkingHoursUseCase upsertWorkingHours;

  EmployeeWorkingHoursBloc({
    required this.clearWorkingHours,
    required this.upsertWorkingHours,
    required this.getWorkingHours,
  }) : super(Empty()) {
    on<GetEmployeeWorkingHoursEvent>((event, emit) async {
      emit(Loading());
      var employeeId = event.id;
      var interval = event.interval;

      var params = GetWorkingHoursParams(id: employeeId, interval: interval);
      var failureOrWorkingHours = await getWorkingHours(params);
      failureOrWorkingHours.fold(
          (failure) => emit(Failed(message: "Failed to get working hours.")),
          (workingHours) => emit(Loaded(workingHours: workingHours,id:employeeId)));
    });


    on<UpsertWorkingHoursEvent>((event,emit) async {
      var workingHours = event.workingHours;
      var employeeId = event.id;
      var params = UpsertWorkingHoursParams(id:employeeId,workingHours: workingHours);
      var failureOrWorkingHours = await upsertWorkingHours(params);
    });
    on<SetEmployeeEvent>((event, emit) async {
      emit(Loading());
      var employeeId = event.id;

      var now = DateTime.now();
      var monday = now.subtract(Duration(days: now.weekday - 1));
      var nextMonday = monday.add(Duration(days: 7));
      var interval = IntervalEntity(start: monday, end: nextMonday);
      var params = GetWorkingHoursParams(id: event.id, interval: interval);

      var failureOrWorkingHours = await getWorkingHours(params);
      failureOrWorkingHours.fold(
          (failure) => emit(Failed(message: "Failed to get working hours.")),
          (workingHours) => emit(Loaded(workingHours: workingHours,id:employeeId)));
    });

    on<ClearWorkingHoursEvent>((event,emit) async {
      var employeeId = event.id;
      var now = DateTime.now();
      var monday = now.subtract(Duration(days: now.weekday - 1));
      var nextMonday = monday.add(Duration(days: 7));
      var interval = IntervalEntity(start: monday, end: nextMonday);
      var params = ClearWorkingHoursParams(id: employeeId, interval: interval);
      await clearWorkingHours.call(params);
      emit(Initial(id: employeeId));

    });

    on<PurgeWorkingHoursEvent>((event,emit) async {
      emit(Empty());
    });
  }
}
