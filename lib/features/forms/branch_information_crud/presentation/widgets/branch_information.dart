import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scrubbers_employee_application/core/domain/entities/branch_entity.dart';
import 'package:scrubbers_employee_application/models/Branch.dart';

import '../../../../../common/get_it_maybe.dart';
import '../../../../../common/quicker/inputs/text_field.dart';
import '../../../../../injection.dart';
import '../../domain/branch_information_updated.dart';
import '../bloc/branch_information_crud_bloc.dart';
import '../bloc/branch_information_crud_event.dart';

class BranchInformationCrud extends StatefulWidget {
  final BranchEntity branch;

  const BranchInformationCrud({
    Key? key,
    required this.branch,
  }) : super(key: key);

  @override
  _BranchInformationCrudState createState() =>
      _BranchInformationCrudState();
}

class _BranchInformationCrudState extends State<BranchInformationCrud> {

  late BranchEntity current;

  void initState(){
    super.initState();
    current = widget.branch;
  }


  Widget _header(String label) => Container(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      decoration: BoxDecoration(
          border:
              Border(bottom: BorderSide(color: Color(0xFFE5E9EB), width: 1))),
      width: double.infinity,
      child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
        Text(label,
            textAlign: TextAlign.left,
            style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Color(0xFF000000)))
      ]));

  saveName(String? value) {
    current = current.copyWith(name: value);
    setState(() {
      current = current;
    });
    sl<BranchInformationCrudBloc>()
        .add(BranchInformationCrudEventPatch(branch: current));
    getItMaybe<BranchInformationUpdatedCallback>()?.call(current);
  }

  saveEmail(String? value) {
    current = current.copyWith(email: value);
    setState(() {
      current = current;
    });    sl<BranchInformationCrudBloc>()
        .add(BranchInformationCrudEventPatch(branch: current));
    getItMaybe<BranchInformationUpdatedCallback>()?.call(current);

  }

  savePhone(String? value) {
    current = current.copyWith(phone: value);
    setState(() {
      current = current;
    });    sl<BranchInformationCrudBloc>()
        .add(BranchInformationCrudEventPatch(branch: current));
    getItMaybe<BranchInformationUpdatedCallback>()?.call(current);

  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: Color(0xFFFFFFFF),
            borderRadius: BorderRadius.circular(6),
            border: Border.all(color: Color(0xFFE5E9EB), width: 1)),
        child: Column(children: [
          _header("Branch Information"),
          Divider(
            color: Color(0xFFE5E9EB),
            thickness: 1,
            height: 1,
          ),
          QuickerTextField(
            labelText: "Branch Id",
            initialValue: widget.branch.id.toString(),
            enabled: false,
          ),
          Divider(
            color: Color(0xFFE5E9EB),
            thickness: 1,
            height: 1,
          ),
          QuickerTextField(
              labelText: "Name",
              initialValue: widget.branch.name.toString(),
              onSaved: saveName),
          Divider(
            color: Color(0xFFE5E9EB),
            thickness: 1,
            height: 1,
          ),
          QuickerTextField(
              labelText: "Email",
              initialValue: widget.branch.email.toString(),
              onSaved: saveEmail),
          Divider(
            color: Color(0xFFE5E9EB),
            thickness: 1,
            height: 1,
          ),
          QuickerTextField(
              labelText: "Phone",
              initialValue: widget.branch.phone.toString(),
              onSaved: savePhone),
        ]));
  }
}
