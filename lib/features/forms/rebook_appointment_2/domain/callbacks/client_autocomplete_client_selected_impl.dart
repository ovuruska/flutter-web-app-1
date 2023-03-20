

import 'package:scrubbers_employee_application/core/domain/entities/client_entity.dart';

import '../../../client_autocomplete/domain/callbacks/client_autocomplete_client_selected.dart';
import '../../../select_client_pets/presentation/bloc/select_client_pets_bloc.dart';
import '../../../select_client_pets/presentation/bloc/select_client_pets_event.dart';
import '../../../../../injection.dart';

class ClientAutocompleteClientSelectedCallbackImpl extends ClientAutocompleteClientSelectedCallback{
  @override
  void call(ClientEntity client) {
    var clientId = client.id;
    sl<SelectClientPetsBloc>().add(SelectClientPetsEventFetchClientPets(id:clientId));
  }

}