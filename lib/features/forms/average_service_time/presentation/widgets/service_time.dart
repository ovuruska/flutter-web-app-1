import 'package:flutter/material.dart';

import '../../../../../common/get_it_maybe.dart';
import '../../../../../common/quicker/inputs/formatters/digits_only_input_formatter.dart';
import '../../domain/callbacks/average_service_time_changed_callback.dart';


class AverageServiceTime extends StatefulWidget {
  final int? averageServiceTime;
  final void Function(int)? onChanged;

  const AverageServiceTime({Key? key, this.averageServiceTime, this.onChanged}) : super(key: key);

  @override
  _AverageServiceTimeState createState() => _AverageServiceTimeState();
}

class _AverageServiceTimeState extends State<AverageServiceTime> {
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  void setControllerText(String text){
    var duration =  int.parse(text);
    getItMaybe<ServiceTimeChangedCallback>()?.call(duration);
    widget.onChanged?.call(duration);
    _controller.text = text;

  }

  String getText(int? value) {
    if (value == null) return '';
    return value.toString();
  }


  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _controller,
      keyboardType: TextInputType.number,
      inputFormatters: [DigitsOnlyInputFormatter()],
      decoration: InputDecoration(
        hintText: getText(widget.averageServiceTime),
        hintStyle: TextStyle(color: Colors.grey),
        labelText: 'Service Time',

        border: UnderlineInputBorder(),
      ),
        onSaved: (value) {
          if (value != null) {
            setControllerText(value);

          }
        },
    );
  }
}
