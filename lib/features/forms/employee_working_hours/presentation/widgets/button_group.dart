

import 'package:flutter/material.dart';

class ButtonGroup extends StatelessWidget{
  final void Function() onClear;
  final void Function() onSave;

  const ButtonGroup({Key? key, required this.onClear, required this.onSave}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Expanded(
            child: Container(
              margin: EdgeInsets.all(8),
              child: ElevatedButton(
                style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all(Colors.white),
                  backgroundColor: MaterialStateProperty.all(Colors.green),
                ),
                onPressed: onSave,
                child: Text("Save"),
              ),
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.all(8),
              child: ElevatedButton(
                style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all(Colors.black),
                  backgroundColor: MaterialStateProperty.all(Colors.yellow),
                ),

                onPressed: onClear,
                child: Text("Clear"),
              ),
            ),
          ),
        ],
      ),
    );
  }


}