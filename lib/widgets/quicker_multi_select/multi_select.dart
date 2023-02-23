import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:scrubbers_employee_application/widgets/quicker_multi_select/chip_list.dart';
import 'package:scrubbers_employee_application/widgets/quicker_multi_select/dropdown_item.dart';
import 'package:scrubbers_employee_application/widgets/white_container.dart';

class QuickerMultiSelect<T> extends StatefulWidget {
  final List<T> items;
  final List<T>? initialValue;
  final Function(List<T>) onChanged;

  const QuickerMultiSelect(
      {Key? key,
      required this.items,
      this.initialValue,
      required this.onChanged})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _QuickerMultiSelectState();
  }
}

class _QuickerMultiSelectState<T> extends State<QuickerMultiSelect<T>> {
  List<T> _selectedItems = [];

  @override
  void initState() {
    super.initState();
    _selectedItems = widget.initialValue ?? [];
  }

  Widget _dialog(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
      child: Dialog(
        child: Container(
            height: 300,
            width: 300,
            child: Column(
              children: [
                StatefulBuilder(
                    builder: (context, dialogSetState) => Expanded(
                          child: ListView.builder(
                            itemCount: widget.items.length,
                            itemBuilder: (context, index) {
                              var value =
                                  _selectedItems.contains(widget.items[index]);
                              return QuickerDropdownItem(
                                key: Key(index.toString() + value.toString()),
                                value: value,
                                item: widget.items[index].toString(),
                                onChanged: (val) {
                                  dialogSetState(() => setState(() {
                                        if (val) {
                                          _selectedItems
                                              .add(widget.items[index]);
                                        } else {
                                          _selectedItems
                                              .remove(widget.items[index]);
                                        }
                                        widget.onChanged(_selectedItems as List<T>);
                                      }));
                                },
                              );
                            },
                          ),
                        )),
                Container(
                    height: 64,
                    margin: EdgeInsets.only(top: 8),
                    padding: EdgeInsets.only(right: 8, left: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        TextButton(
                          onPressed: () {
                            setState(() {
                              _selectedItems = [];
                              widget.onChanged(_selectedItems as List<T>);
                            });
                            Navigator.pop(context);
                          },
                          child: Text('Clear'),
                        ),
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: Text('Ok'),
                        ),
                      ],
                    ))
              ],
            )),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        constraints: BoxConstraints(minHeight: 160),
        child: WhiteContainer(
          padding: EdgeInsets.all(8),
          child: Stack(children: [
            QuickerChipList<T>(
              items: _selectedItems,
              onPressed: (item) {
                setState(() {
                  _selectedItems.remove(item);
                  widget.onChanged(_selectedItems as List<T>);
                });
              },
            ),
            Positioned(
                right: 8,
                child: IconButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.transparent),
                      shape: MaterialStateProperty.all(CircleBorder())),
                  icon: Icon(Icons.arrow_drop_down),
                  onPressed: () => showDialog(
                      context: context, builder: (_) => _dialog(context)),
                ))
          ]),
        ));
  }
}
