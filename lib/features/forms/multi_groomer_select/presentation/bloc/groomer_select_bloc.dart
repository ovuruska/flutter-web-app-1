import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scrubbers_employee_application/core/domain/entities/employee_entity.dart';
import 'package:scrubbers_employee_application/core/domain/usecases/get_all_groomers.dart';
import 'package:scrubbers_employee_application/core/use_case.dart';

import 'groomer_select_event.dart';
import 'groomer_select_state.dart';

class MultiGroomerSelectBloc extends Bloc<MultiGroomerSelectEvent, MultiGroomerSelectState> {
  final GetAllGroomersUseCase getGroomers;

  MultiGroomerSelectBloc(this.getGroomers) : super(MultiGroomerSelectState()) {
    on<MultiGroomerSelectEventChanged>((event, emit) {});
    on<MultiGroomerSelectEventFetch>((event, emit) async {
      var params = NoParams();
      var response = await getGroomers(params);
      List<EmployeeEntity> groomers = response.fold((l) => [], (r) => r);
      groomers.sort((a, b) => a.name.compareTo(b.name));
      emit(MultiGroomerSelectState(options: groomers));
    });
  }
}
