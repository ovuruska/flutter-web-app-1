
import 'package:flutter/material.dart';

class DashboardFilters extends StatelessWidget {
  const DashboardFilters({
    Key? key,
    required this.onFilterChanged,
  }) : super(key: key);

  final Function onFilterChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width:180,
          height: 320,
          child:Column(
            mainAxisSize: MainAxisSize.max,
          )
        ),
        VerticalDivider()
      ],
    );
  }
}