import 'package:flutter/material.dart';
import 'general_search.dart';

class ClientSearchInitial extends StatelessWidget {

  final Function(String)? onChanged;
  final Function(String)? onSubmitted;

  const ClientSearchInitial({Key? key, this.onChanged, this.onSubmitted}) : super(key: key);

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
              onSubmitted: onSubmitted,
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
