import 'package:flutter/material.dart';

class HeadlessDataTable extends StatelessWidget {
  final List<DataRow> rows;
  final int numberOfColumns;
  HeadlessDataTable(
      {Key? key, required this.rows, required this.numberOfColumns});

  @override
  Widget build(BuildContext context) {
    return Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: DataTable(
          headingRowHeight: 0,
          dividerThickness: 0,
          columns: List.generate(
              numberOfColumns, (index) => DataColumn(label: Container())),
          rows: rows,
        ));
  }
}
