import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../core/domain/entities/client_entity.dart';

class ClientAutocomplete extends StatefulWidget {
  final bool readOnly;
  final List<ClientEntity> options;
  final String? initialValue;
  final void Function(ClientEntity)? onSelected;
  final void Function(String?)? onChanged;

  const ClientAutocomplete(
      {Key? key,
      required this.options,
      this.initialValue,
      this.readOnly = false,
      this.onSelected,
      this.onChanged})
      : super(key: key);

  @override
  _ClientAutocompleteState createState() => _ClientAutocompleteState();
}

class _ClientAutocompleteState extends State<ClientAutocomplete> {
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller.text = widget.initialValue ?? '';
  }

  Widget _readOnly() {
    return TextFormField(
      readOnly: true,
      controller: _controller,
      decoration: InputDecoration(
        labelText: 'Owner name',
        border: UnderlineInputBorder(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (widget.readOnly) {
      return _readOnly();
    } else {
      return Autocomplete<ClientEntity>(
        fieldViewBuilder: (BuildContext context,
            TextEditingController fieldTextEditingController,
            FocusNode fieldFocusNode,
            VoidCallback onFieldSubmitted) {
          return TextField(
            controller: fieldTextEditingController,
            focusNode: fieldFocusNode,
            decoration: InputDecoration(
              floatingLabelStyle: GoogleFonts.openSans(
                fontSize: 12,
                color: const Color(0xFF2D7CB6),
              ),
              contentPadding: const EdgeInsets.all(8),
              labelText: 'Owner name',
              labelStyle: GoogleFonts.openSans(color:const Color(0xFF9AA6AC)),
              border: UnderlineInputBorder(
                borderSide: BorderSide(color:const Color(0xFFDDE2E4),width:0.5),
              ),
            ),
            style: GoogleFonts.openSans(color:const Color(0xFF000000)),
          );
        },
        onSelected: (ClientEntity selection) {
          if (widget.onSelected != null) {
            widget.onSelected!(selection);
          }
        },
        optionsBuilder: (TextEditingValue textEditingValue) {
          if (textEditingValue.text == '') {
            return const Iterable<ClientEntity>.empty();
          }
          if (widget.onChanged != null) {
            widget.onChanged!(textEditingValue.text);
          }
          return widget.options as Iterable<ClientEntity>;
        },
      );
    }
  }
}
