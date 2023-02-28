import 'package:flutter/material.dart';

import '../../domain/entity/log_entity.dart';
import 'log_card.dart';

class LogList extends StatelessWidget {
  final List<LogEntity> logs;

  const LogList({
    Key? key,
    required this.logs,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(vertical:16),
        child:GridView.count(
          childAspectRatio: 3,
      crossAxisCount: 2,
      shrinkWrap: true,
      children: List.generate(logs.length, (index) {
        return Container(
            margin: EdgeInsets.all(16), child: LogCard(log: logs[index]));
      }),
    )));
  }
}
