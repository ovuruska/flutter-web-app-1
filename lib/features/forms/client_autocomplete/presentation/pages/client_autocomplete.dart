import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scrubbers_employee_application/common/get_it_maybe.dart';
import 'package:scrubbers_employee_application/core/domain/entities/client_entity.dart';

import '../../../../../injection.dart';
import '../../domain/callbacks/client_autocomplete_client_selected.dart';
import '../bloc/client_autocomplete_bloc.dart';
import '../bloc/client_autocomplete_event.dart';
import '../bloc/client_autocomplete_state.dart';
import '../widgets/client_autocomplete.dart';

class ClientAutocompleteView extends StatelessWidget {

  final void Function(ClientEntity)? onSelected;
  final ClientEntity? initialValue;

  const ClientAutocompleteView({Key? key, this.onSelected, this.initialValue}) : super(key: key);


  void onChanged(String? value) {
    if (value == null || value == '')
      sl<ClientAutocompleteBloc>()
          .add(ClientAutocompleteEventCleared());
    else
      sl<ClientAutocompleteBloc>()
          .add(ClientAutocompleteEventChanged(query: value));
  }

  void onSelectedCallback(ClientEntity value) {
    getItMaybe<ClientAutocompleteClientSelectedCallback>()?.call(value);
    onSelected?.call(value);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ClientAutocompleteBloc, ClientAutocompleteState>(
      bloc: sl<ClientAutocompleteBloc>(),
      builder: (context, state) {
          var options = state.options;
          return ClientAutocomplete(
            key:ValueKey(initialValue?.name?? 'empty'),
            initialValue: initialValue?.name,
            options: options,
            onChanged:onChanged,
            onSelected: onSelectedCallback,
          );


      },
    );
  }
}
