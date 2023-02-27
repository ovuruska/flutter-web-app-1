import 'package:card_settings/card_settings.dart';
import 'package:flutter/material.dart';
import '../../domain/entities/employee_entity.dart';


class EmployeeCardSettings extends StatefulWidget {

  final EmployeeEntity employee;
  final Function(EmployeeEntity) onSaved;
  final Function(EmployeeEntity) onRemoved;

  const EmployeeCardSettings(
      {Key? key,
        required this.employee,
        required this.onSaved,
        required this.onRemoved})
      : super(key: key);

  @override
  _EmployeeCardSettingsState createState() => _EmployeeCardSettingsState();
}

class _EmployeeCardSettingsState extends State<EmployeeCardSettings> {

  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  fetchFromParent() {

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

    super.dispose();
  }

  get current => EmployeeEntity(
      id: widget.employee.id,
      name: nameController.text,
      phone: phoneController.text,
      email: emailController.text

  );

  onRemoved() {
    widget.onRemoved(current);
  }

  onSaved() {
    widget.onSaved(current);
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: CardSettings(cardless: true, children: <CardSettingsSection>[
        CardSettingsSection(
          header: CardSettingsHeader(
            color: Colors.transparent,
            label: "Employee #${widget.employee.id}",
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
