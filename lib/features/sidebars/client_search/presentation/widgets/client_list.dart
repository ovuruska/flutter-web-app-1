import 'package:flutter/material.dart';
import 'package:scrubbers_employee_application/common/get_it_maybe.dart';

import '../../domain/callbacks/select_client_callback.dart';
import '../../domain/entities/client_search_entity.dart';
import 'client_item.dart';

class ClientList extends StatelessWidget {
  final List<ClientSearchEntity> clients;
  final String query;

  const ClientList({Key? key, required this.clients, required this.query}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return ListView(
      children: clients.map((client) => ClientItem(client: client, query: query,onSelect: getItMaybe<SelectClientCallback>(),)).toList()
    );
  }
}