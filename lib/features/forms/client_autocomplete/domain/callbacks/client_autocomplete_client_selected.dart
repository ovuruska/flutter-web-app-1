

import 'package:scrubbers_employee_application/core/domain/entities/client_entity.dart';

abstract class ClientAutocompleteClientSelectedCallback {
  void call(ClientEntity client);
}