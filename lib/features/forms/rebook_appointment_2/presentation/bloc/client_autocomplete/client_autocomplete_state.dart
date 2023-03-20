import 'package:equatable/equatable.dart';

import '../../../../../../core/domain/entities/client_entity.dart';

class ClientAutocompleteState extends Equatable {
  final List<ClientEntity> options;
  const ClientAutocompleteState({
    this.options = const [],
  });

  @override
  List<Object> get props => options;
}


