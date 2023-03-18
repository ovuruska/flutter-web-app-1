import 'package:flutter/material.dart';

class DataCard2 extends StatelessWidget {
  final String header;
  final String content;
  final int percent;

  const DataCard2(
      {Key? key,
      required this.header,
      required this.content,
      required this.percent})
      : super(key: key);

  Widget _indicatorAndPercent(int percent) {
    if (percent < 0) {
      var color = const Color.fromRGBO(234, 70, 65, 1);
      percent *= -1;
      return Row(
        children: [
          Text('- $percent%',
              style: TextStyle(
                fontFamily: "Plus Jakarta Sans",
                color: color,
              )),
          Icon(Icons.arrow_downward, color: color, size: 16)
        ],
      );
    } else {
      percent += 1;
      var color = const Color.fromRGBO(40, 188, 90, 1);
      return Row(
        children: [
          Text('+ $percent%',
              style: TextStyle(
                fontFamily: "Plus Jakarta Sans",
                color: color,
              )),
          Icon(Icons.arrow_upward, color: color, size: 16)
        ],
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    var borderColor = const Color.fromRGBO(224,224, 227, 1);
    return Container(
        height: 96,
        width: 240,
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: borderColor)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(header,
                style: TextStyle(
                  color: const Color.fromRGBO(102, 102, 110, 1),
                  fontSize: 12,
                  fontFamily: "Plus Jakarta Sans",
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(content,
                    style: TextStyle(
                      color: const Color.fromRGBO(102, 102, 110, 1),
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                      fontFamily: "Plus Jakarta Sans",
                    )),
                _indicatorAndPercent(percent)
              ],
            )
          ],
        ));
  }
}
