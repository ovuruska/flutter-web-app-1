import 'package:flutter/material.dart';
import 'package:scrubbers_employee_application/common/time_of_day.dart';

class QuickerTimeOfDayDropdown extends StatefulWidget {
  final ValueChanged<TimeOfDay?>? onChanged;
  final TimeOfDay? initialValue;
  final String? labelText;
  final String? hintText;
  final bool? enabled;
  final int interval;
  final TimeOfDay start;
  final TimeOfDay end;

  const QuickerTimeOfDayDropdown(
      {Key? key,
      this.onChanged,
      this.initialValue,
      this.labelText,
      this.hintText,
      this.enabled,
      this.interval = 30,
      this.start = const TimeOfDay(hour: 8, minute: 0),
      this.end = const TimeOfDay(hour: 20, minute: 0)
      }) : super(key: key);

  @override
  _QuickerTimeOfDayDropdownState createState() =>
      _QuickerTimeOfDayDropdownState();
}

class _QuickerTimeOfDayDropdownState extends State<QuickerTimeOfDayDropdown> {
  late TimeOfDay? _value;

  @override
  void initState() {
    super.initState();
    _value = widget.initialValue;
  }

  onSelected(TimeOfDay? value) {
    setState(() {
      _value = value;
    });
    if (widget.onChanged != null) widget.onChanged!(value);
  }

  List<TimeOfDay> options() {
    final List<TimeOfDay> values = [];
    var current = widget.start;
    while(current.isBefore( widget.end)){
      values.add(current);
      current = current.replacing(minute: current.minute + widget.interval);
    }
    return values;
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<TimeOfDay>(
      isExpanded: true,
      items: options()
          .map((e) => DropdownMenuItem<TimeOfDay>(
                value: e,
                child: Text(e.format(context)),
              ))
          .toList(),
      value: _value,
      onChanged: widget.enabled == null || widget.enabled! ? onSelected : null,
      decoration: InputDecoration(
        labelText: widget.labelText,

        hintText: widget.hintText,
      ),
    );
  }
}
