

import 'package:flutter/material.dart';

class SelectService extends StatefulWidget {
  final String initialValue;
  final Function(String?)? onChanged;

  const SelectService({Key? key, required this.initialValue, this.onChanged}) : super(key: key);

  @override
  _SelectServiceState createState() => _SelectServiceState();
}

class _SelectServiceState extends State<SelectService> {
  final TextEditingController _controller = TextEditingController();
  late String _value;

  onChanged(String? value){
    setState(() {
      _value = value!;
      if(widget.onChanged!=null) widget.onChanged!(value);
    });
  }

  final options = [
    'We Wash',
    'Full Grooming'
  ];

  @override
  void initState() {
    super.initState();
    _value = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      isExpanded: true,
      items:options.map(
      (e) => DropdownMenuItem<String>(child: Text(e),value: e,)
    ).toList(
    ),value:_value, onChanged:  onChanged,);
  }
}