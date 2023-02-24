import 'package:flutter/material.dart';

import 'header_button.dart';

class Header extends StatelessWidget {
  static final buttonNames = [
    ['Dashboard', "Dashboard"],
    /*
    ['Pets', "Pets"],
    ["Appointments", "Appointments"],
    ['Customers', "Customers"],
    ['Payroll', "Payroll"],
    ['Notifications', "Notifications"],
   */
    ['Admin', "Admin"],
    ['Sign Out', "Signout"],
  ];

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 0,
      child: Flex(
        direction: Axis.horizontal,
        children: [
          for (int i = 0; i < buttonNames.length; i++)
            HeaderButton(text: buttonNames[i][0], route: buttonNames[i][1])
        ],
      ),
    );
  }
}
