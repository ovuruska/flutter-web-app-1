import 'package:flutter/material.dart';

class AverageServiceTime extends StatefulWidget {
  final int? averageServiceTime;

  const AverageServiceTime({Key? key, this.averageServiceTime}) : super(key: key);

  @override
  _AverageServiceTimeState createState() => _AverageServiceTimeState();
}

class _AverageServiceTimeState extends State<AverageServiceTime> {
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
      decoration: InputDecoration(
        hintText: widget.averageServiceTime?.toString() ?? '',
        labelText: 'Service Time',
        border: UnderlineInputBorder(),
      ),
    );
  }
}
