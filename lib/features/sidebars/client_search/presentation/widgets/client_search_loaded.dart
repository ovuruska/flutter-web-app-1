import 'package:flutter/material.dart';

import '../../domain/entities/client_search_entity.dart';
import 'client_list.dart';
import 'general_search.dart';

class ClientSearchLoaded extends StatelessWidget {

  final List<ClientSearchEntity> clients;
  final String query;
  final Function(String)? onChanged;
  final Function(String)? onSubmitted;

  const ClientSearchLoaded({Key? key, required this.clients, required this.query, this.onChanged, this.onSubmitted}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFF6F8F9),
        body: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GeneralSearch(onChanged: onChanged,onSubmitted: onSubmitted,),
            Container(height:32),
            Expanded(
              child:ClientList(
                clients: clients,
                query: query

              )
            )
          ],
        ));
  }
}
