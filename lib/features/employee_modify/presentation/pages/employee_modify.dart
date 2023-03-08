import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scrubbers_employee_application/features/employee_modify/presentation/bloc/employee_modify_bloc.dart';
import 'package:scrubbers_employee_application/features/employee_modify/presentation/widgets/employee_card_settings.dart';

import '../../../../injection.dart';
import '../../domain/entities/employee_entity.dart';
import '../bloc/employee_modify_event.dart';
import '../bloc/employee_modify_state.dart';

class EmployeeModifyView extends StatelessWidget {
  final Function(EmployeeEntity)? onSaved;
  final Function(EmployeeEntity)? onRemoved;

  const EmployeeModifyView({Key? key, this.onRemoved, this.onSaved})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EmployeeModifyBloc, EmployeeModifyState>(
        bloc: sl<EmployeeModifyBloc>(),
        builder: (context, state) {
          if (state is Loaded) {
            var initialValue = state.employee;
            return EmployeeCardSettings(
              initialValue: initialValue,
              onSaved: (entity){
                sl<EmployeeModifyBloc>()
                    .add(EmployeeModifySaveEvent(entity));

                onSaved?.call(entity);
              },
              onRemoved: (entity) {
                sl<EmployeeModifyBloc>()
                    .add(EmployeeModifyRemoveEvent(initialValue.id));

                onRemoved?.call(initialValue);
              },
            );
          } else if (state is Loading) {
            return Center(child: CircularProgressIndicator());
          } else {
            return Container();
          }
        });
  }
}
