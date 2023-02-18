import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class FlutterFlowDropDown<T> extends StatelessWidget {
  const FlutterFlowDropDown({
    required this.value,
    this.initialOption,
    this.hintText,
    required this.options,
    this.optionLabels,
    required this.onChanged,
    this.icon,
    this.width,
    this.height,
    this.fillColor,
    required this.textStyle,
    required this.elevation,
    required this.borderWidth,
    required this.borderRadius,
    required this.borderColor,
    required this.margin,
    this.hidesUnderline = false,
    this.disabled = false,
  });

  final T? initialOption;
  final String? hintText;
  final List<T> options;
  final List<String>? optionLabels;
  final Function(T?) onChanged;
  final Widget? icon;
  final double? width;
  final double? height;
  final Color? fillColor;
  final TextStyle textStyle;
  final double elevation;
  final double borderWidth;
  final double borderRadius;
  final Color borderColor;
  final EdgeInsetsGeometry margin;
  final bool hidesUnderline;
  final bool disabled;
  final T value;

  @override
  Widget build(BuildContext context) {
    final dropdownWidget = DropdownButton<T>(
      value: value,

      hint: hintText != null
          ? Text(hintText!, style: textStyle, overflow: TextOverflow.clip)
          : null,
      items: options
          .asMap()
          .entries
          .map(
            (option) => DropdownMenuItem<T>(
              value: option.value,
              child: Text(
                optionLabels == null || optionLabels!.length < option.key + 1
                    ? option.value.toString()
                    : optionLabels![option.key],
                style: textStyle,
              ),
            ),
          )
          .toList(),
      elevation: elevation.toInt(),
      onChanged: !disabled
          ? (value) {
              onChanged(value);
            }
          : null,
      icon: icon,
      isExpanded: true,
      focusColor: Colors.transparent,
    );
    final childWidget = Padding(
      padding: margin,
      child: dropdownWidget,
    );
    if (height != null || width != null) {
      return Container(
        width: width,
        height: height,
        child: childWidget,
      );
    }
    return childWidget;
  }
}
