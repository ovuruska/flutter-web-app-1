import 'package:flutter/material.dart';

class ServiceTime extends StatefulWidget {
  final int? averageServiceTime;

  const ServiceTime({Key? key, this.averageServiceTime}) : super(key: key);

  @override
  _ServiceTimeState createState() => _ServiceTimeState();
}

class _ServiceTimeState extends State<ServiceTime> {
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller.text = widget.averageServiceTime.toString();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _controller,
      readOnly: true,
      decoration: InputDecoration(
        hintText: widget.averageServiceTime?.toString() ?? '',
        labelText: 'Average Service Time',
        border: OutlineInputBorder(),
      ),
    );
  }
}
