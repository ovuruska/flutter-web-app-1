import 'package:flutter/material.dart';

class QuickerChip extends StatelessWidget {
  final String label;
  final Function onPressed;
  final Color? backgroundColor;

  const QuickerChip(
      {Key? key,
      required this.label,
      required this.onPressed,
      this.backgroundColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
        hitTestBehavior: HitTestBehavior.deferToChild,
        cursor: SystemMouseCursors.click,
        opaque: false,
        child: GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () => onPressed(),
            child: Chip(
              avatar: CircleAvatar(
                backgroundColor: Colors.grey.shade800,
                child: Text(
                  label[0],
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              label: Text(label),
              backgroundColor: backgroundColor,
              elevation: 6.0,
            )));
  }
}
