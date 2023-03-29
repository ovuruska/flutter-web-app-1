import 'package:card_settings/card_settings.dart';
import 'package:flutter/material.dart';

import '../../domain/entities/employee_entity.dart';
import 'select_role.dart';

class EmployeeCardSettings extends StatefulWidget {
  final EmployeeEntity initialValue;
  final Function(EmployeeEntity)? onSaved;
  final Function(EmployeeEntity)? onRemoved;

  const EmployeeCardSettings(
      {Key? key, required this.initialValue, this.onSaved, this.onRemoved})
      : super(key: key);

  @override
  _EmployeeCardSettingsState createState() => _EmployeeCardSettingsState();
}

class _EmployeeCardSettingsState extends State<EmployeeCardSettings> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  int role = 10;

  fetchFromParent() {
    nameController.text = widget.initialValue.name.replaceAll("\n", " ");
    phoneController.text = widget.initialValue.phone.replaceAll("\n", " ");
    emailController.text = widget.initialValue.email.replaceAll("\n", " ");
    role = widget.initialValue.role;
  }

  @override
  void initState() {
    super.initState();
    fetchFromParent();
  }

  onUndo() {
    setState(() {
      fetchFromParent();
    });
  }

  @override
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    emailController.dispose();
    super.dispose();
  }

  get current => EmployeeEntity(
      id: widget.initialValue.id,
      name: nameController.text,
      phone: phoneController.text,
      email: emailController.text,
      role: role);

  onRemoved() {
    if (widget.onRemoved != null) {
      widget.onRemoved!(current);
    }
  }

  onSaved() {
    if (widget.onSaved != null) {
      widget.onSaved!(current);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: CardSettings(cardless: true, children: <CardSettingsSection>[
        CardSettingsSection(
          header: CardSettingsHeader(
            color: Colors.transparent,
            label: "Employee #${widget.initialValue.id}",
          ),
          children: <CardSettingsWidget>[
            CardSettingsText(
              controller: nameController,
              maxLength: 80,
              fieldPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 4),
              contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 4),
              label: 'Name',
              validator: (value) {
                if (value == null || value.isEmpty) return 'Name is required.';
                if (value.length > 80) return 'Name is too long.';
                return null;
              },
            ),
            CardSettingsText(
              controller: phoneController,
              fieldPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 4),
              contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 4),
              label: 'Phone',
            ),
            CardSettingsText(
              controller: emailController,
              fieldPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 4),
              contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 4),
              label: 'Email',
            ),
            CardSettingsHeader(
                child: Row(children: [
                  Container(width: 8),
              Text(
                "Role",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Container(width: 88),
              SelectRole(
                  initialValue: role,
                  onChanged: (value) {
                    setState(() {
                      role = value;
                    });
                  },
                ),
            ])),
            CardSettingsHeader(
                child: Row(
              children: [
                Expanded(
                    child: CardSettingsButton(
                  label: "Save",
                  backgroundColor: Colors.green,
                  textColor: Colors.white,
                  onPressed: () => onSaved(),
                )),
                Expanded(
                    child: CardSettingsButton(
                  label: "Remove",
                  backgroundColor: Colors.red,
                  textColor: Colors.white,
                  onPressed: () => onRemoved(),
                )),
                Expanded(
                    child: CardSettingsButton(
                        label: "Undo",
                        backgroundColor: Colors.amber,
                        textColor: Colors.black,
                        onPressed: onUndo)),
              ],
            ))
          ],
        ),
      ]),
    );
  }
}
