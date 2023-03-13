import 'package:flutter/material.dart';
import 'package:scrubbers_employee_application/features/client_search/presentation/widgets/client_list.dart';

import '../../domain/entities/client_search_entity.dart';
import 'general_search.dart';

class ClientSearchInitial extends StatelessWidget {

  final Function(String)? onChanged;

  const ClientSearchInitial({Key? key, this.onChanged}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFF6F8F9),
        body: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GeneralSearch(
              onChanged: onChanged,
            ),
            Container(height:32),
            Expanded(
                child:Center(
                  child: Text("No results"),
                )
            )
          ],
        ));
  }
}
