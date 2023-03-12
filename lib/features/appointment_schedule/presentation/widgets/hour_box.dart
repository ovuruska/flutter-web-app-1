

import 'package:flutter/cupertino.dart';

import '../../utils/border.dart';
import '../../utils/constants.dart';

class HourBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: boxWidth,
        height: boxHeight,
        child: Container(
          decoration: BoxDecoration(
            border: border(),
          ),
          padding: EdgeInsets.all(8),
        ));
  }

}