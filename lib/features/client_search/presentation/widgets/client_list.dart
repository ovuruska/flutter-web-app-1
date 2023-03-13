

import 'package:flutter/material.dart';
import 'package:scrubbers_employee_application/features/client_search/presentation/widgets/client_item.dart';

import '../../domain/entities/client_search_entity.dart';

class ClientList extends StatelessWidget {
  final List<ClientSearchEntity> clients;
  final String query;

  const ClientList({Key? key, required this.clients, required this.query}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return ListView(
      children: clients.map((client) => ClientItem(client: client, query: query)).toList()
    );
  }
}