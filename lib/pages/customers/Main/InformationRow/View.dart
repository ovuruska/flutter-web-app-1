import 'package:flutter/material.dart';

import 'ClientInformation.dart';

class CustomersMainInformationRowView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(16),
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CustomersMainInformationRowClientInformation(),
            ]));
  }
}
