

import 'package:flutter/material.dart';
import 'package:scrubbers_employee_application/features/client_search/presentation/widgets/client_item.dart';

import '../../../../injection.dart';
import '../../domain/callbacks/select_client_callback.dart';
import '../../domain/entities/client_search_entity.dart';

class ClientList extends StatelessWidget {
  final List<ClientSearchEntity> clients;
  final String query;

  const ClientList({Key? key, required this.clients, required this.query}) : super(key: key);

  SelectClientCallback? getCallback() {
    try{
      return sl<SelectClientCallback>();
    }catch(e){
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {

    var callback = getCallback();


    return ListView(
      children: clients.map((client) => ClientItem(client: client, query: query,onSelect: callback,)).toList()
    );
  }
}