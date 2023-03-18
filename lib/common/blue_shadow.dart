import 'package:flutter/material.dart';
import 'box_decoration_merge.dart';



class BlueShadow extends StatelessWidget {
  final Widget child;
  final BoxDecoration? decoration;
  final EdgeInsetsGeometry? padding;
  final double? height;
  final double? width;

  const BlueShadow({Key? key, required this.child, this.decoration, this.padding, this.height, this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: padding,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF90D7FF).withOpacity(.23),
            offset: Offset(0, 4),
            blurRadius: 10,
          ),
        ],
      ).merge(decoration),
      child: child,
    );
  }
}
