import 'dart:async';

import 'package:checkmark/checkmark.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:stream_transform/stream_transform.dart';

class SavableTextField extends StatefulWidget {
  final Function(String) onSaved;
  final String? initialValue;
  final TextEditingController? controller;

  const SavableTextField(
      {Key? key, required this.onSaved, this.initialValue, this.controller})
      : super(key: key);
  @override
  _SavableTextFieldState createState() => _SavableTextFieldState();
}

class _SavableTextFieldState extends State<SavableTextField> {
  bool typing = false;
  StreamController<String> streamController = StreamController();
  @override
  void initState() {
    streamController.stream
        .debounce(Duration(milliseconds: 2000))
        .listen((s) {})
        .onData((data) {
      widget.onSaved(data);
      setState(() {
        typing = false;
      });
    });

    super.initState();
  }

  Widget _positioned(Widget child, {required bool visible}) => Positioned(
      right: 8,
      bottom: 8,
      child: AnimatedOpacity(
        opacity: visible ? 1 : 0,
        duration: Duration(milliseconds: 250),
        child: child,
      ));

  @override
  Widget build(BuildContext context) {
    return Stack(fit: StackFit.expand, children: [
      Container(
          child: TextFormField(
        initialValue: widget.initialValue,
        decoration: InputDecoration(
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: Colors.black.withOpacity(.5))),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: Colors.black.withOpacity(.5))),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: Colors.black.withOpacity(.5)))),
        maxLines: null,
        expands: true,
        textAlignVertical: TextAlignVertical.top,
        controller: widget.controller,
        onChanged: (s) {
          if (!typing)
            setState(() {
              typing = true;
            });
          streamController.add(s);
        },
      )),
      _positioned(
        SpinKitRing(
          color: Colors.blue.withOpacity(.5),
          size: 32.0,
        ),
        visible: typing,
      ),
      _positioned(
          SizedBox(
            height: 32,
            width: 32,
            child: CheckMark(
              active: !typing,
              curve: Curves.decelerate,
              inactiveColor: Colors.blue.withOpacity(.5),
              duration: const Duration(milliseconds: 500),
            ),
          ),
          visible: !typing)
    ]);
  }
}
