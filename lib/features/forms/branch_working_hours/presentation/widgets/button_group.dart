

import 'package:flutter/material.dart';

class ButtonGroup extends StatelessWidget{
  final void Function() onClear;
  final void Function() onSave;
  final void Function() onRemove;

  const ButtonGroup({Key? key, required this.onClear, required this.onSave, required this.onRemove}) : super(key: key);

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
                  backgroundColor: MaterialStateProperty.all( const Color(0xFF3894D7)),
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
          Expanded(
            child: Container(
              margin: EdgeInsets.all(8),
              child: ElevatedButton(
                style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all(Colors.white),
                  backgroundColor: MaterialStateProperty.all( const Color(0xFFFF5B5B)),
                ),
                onPressed: onRemove,
                child: Text("Remove"),
              ),
            ),
          )
        ],
      ),
    );
  }


}