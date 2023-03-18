import 'package:card_settings/card_settings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../domain/entities/branch_entity.dart';

class BranchCardSettings extends StatefulWidget {
  final BranchEntity branch;
  final Function(BranchEntity) onSaved;
  final Function(BranchEntity) onRemoved;

  const BranchCardSettings(
      {Key? key,
      required this.branch,
      required this.onSaved,
      required this.onRemoved})
      : super(key: key);

  @override
  _BranchCardSettingsState createState() => _BranchCardSettingsState();
}

class _BranchCardSettingsState extends State<BranchCardSettings> {
  TextEditingController nameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  fetchFromParent() {
    nameController.text = widget.branch.name.replaceAll("\n", " ");
    addressController.text = widget.branch.address.replaceAll("\n", " ");
    phoneController.text = widget.branch.phone.replaceAll("\n", " ");
    emailController.text = widget.branch.email.replaceAll("\n", " ");
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
    addressController.dispose();
    phoneController.dispose();
    emailController.dispose();
    super.dispose();
  }

  get current => BranchEntity(
      id: widget.branch.id,
      name: nameController.text,
      address: addressController.text,
      phone: phoneController.text,
      email: emailController.text);

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
            label: "Branch #${widget.branch.id}",
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
              controller: addressController,
              fieldPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 4),
              contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 4),
              label: 'Address',
              maxLength: 300,
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
