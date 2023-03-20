import 'package:flutter/material.dart';

/*
Can you generate a chip input field using ChipInput widget in Dart and Flutter?
It should have those features:
1. Inputs should be given from text input form.
2. Chips will be at same form field with text input.
3. Chips can be removed by x button at the end of their content.
4. Chips is viewed inside a wrapped component after text input.
 */
class ChipTextField<T> extends StatefulWidget {
  final List<T> options;
  final List<T>? initialValue;
  final void Function(List<T>)? onChanged;

  const ChipTextField({Key? key, this.options = const [], this.initialValue, this.onChanged})
      : super(key: key);

  @override
  _ChipTextFieldState createState() => _ChipTextFieldState();
}

class _ChipTextFieldState<T extends Object> extends State<ChipTextField<T>> {
  late List<T> _options;

  @override
  void initState() {
    super.initState();
    _options = widget.initialValue ?? <T>[];
  }

  void onChanged(T value){
    setState(() {
      _options.add(value);
      if(widget.onChanged != null){
        widget.onChanged!(_options);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Autocomplete<T>(
      fieldViewBuilder: (BuildContext context,
          TextEditingController fieldTextEditingController,
          FocusNode fieldFocusNode,
          VoidCallback onFieldSubmitted) {
        return Container(
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Wrap(children: [
              ..._options
                  .map((e) => Chip(
                label: Text(e.toString()),
                onDeleted: () {
                  setState(() {
                    _options.remove(e);
                  });
                },
              ))
                  .toList(),
              TextField(
                controller: fieldTextEditingController,
                focusNode: fieldFocusNode,
                onSubmitted: (value) {
                  setState(() {
                    _options.add(value as T);
                    fieldTextEditingController.clear();
                  });
                },
                decoration: InputDecoration(
                  labelText: '',
                  border: InputBorder.none,
                ),
                style: const TextStyle(color:Colors.black,fontWeight: FontWeight.bold),
              )
            ]));
      },

      onSelected: (T selection) {
        setState(() {
          _options.add(selection);
        });
      },
      optionsBuilder: (TextEditingValue textEditingValue) {
        if (textEditingValue.text == '') {
          return Iterable<T>.empty();
        }
        var text = textEditingValue.text;

        return widget.options.where((e){
          var contains = e.toString().contains(text);
          var notIn = !_options.contains(e);

          return contains && notIn;
        }) as Iterable<T>;
      },
    );
  }
}
