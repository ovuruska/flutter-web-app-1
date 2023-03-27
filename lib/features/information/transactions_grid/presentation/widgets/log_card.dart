import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../domain/entity/log_entity.dart';
import 'card_description.dart';

class LogCard extends StatelessWidget {
  LogEntity log;
  LogCard({Key? key, required this.log}) : super(key: key);

  Widget _text(
    String text,
  ) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 16,
        color: Colors.black,
        fontWeight: FontWeight.w500,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var targetName = log.target.name;
    var createdAt = log.createdAt;
    var dateFormat = DateFormat('dd MMM yyyy hh:mm a');
    var formattedDate = dateFormat.format(createdAt);

    return Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 4,
              offset: Offset(0, 2), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  child: Text(
                    targetName[0],
                    style: TextStyle(fontSize: 32),
                  ),
                ),
                Container(width: 16),
                _text(targetName),
                VerticalDivider(
                  width: 16,
                  thickness: 2,
                  color: Colors.black,
                ),
                _text(formattedDate),
              ],
            ),
            Container(height:32),
            Expanded(
                child: CardDescription(
              description: log.description,
            ))
          ],
        ));
  }
}
