import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:scrubbers_employee_application/core/domain/entities/daily_slot.dart';

const Color dangerColor = Color(0xFFFF424B);
const Color availableColor = Color(0xFF3DBF3B);
const Color hoverColor = Color(0xFFFA9700);

class BranchSlot extends StatefulWidget {
  final DailySlotEntity slot;
  final Function(DailySlotEntity)? onClick;

  BranchSlot({required this.slot, this.onClick});

  @override
  _BranchSlotState createState() => _BranchSlotState();
}

class _BranchSlotState extends State<BranchSlot> {
  bool _isHovering = false;

  @override
  Widget build(BuildContext context) {
    // Mon - 12/23/2022
    var formatter = new DateFormat('EEE - MM/dd/yyyy');
    return MouseRegion(
      onEnter: (event) => setState(() => _isHovering = true),
      onExit: (event) => setState(() => _isHovering = false),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 150),
        margin: EdgeInsets.all(4),
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: _isHovering ? hoverColor : Colors.white,
          border: Border.all(color: const Color(0xFFE9ECEF), width: 2),
          borderRadius: BorderRadius.circular(8),
          boxShadow: _isHovering
              ? [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 7,
              offset: Offset(0, 3),
            ),
          ]
              : [],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Generate two circles
            widget.slot.morningCapacity < .6 ? _available() : _danger(),
            Container(width: 4),
            widget.slot.afternoonCapacity < .6 ? _available() : _danger(),
            Container(width: 8),
            Text(formatter.format(widget.slot.date), style: GoogleFonts.manrope()),
            Container(width: 4),
            Text("|", style: GoogleFonts.manrope(fontSize: 16)),
            Container(width: 4),
            Text(_branchName(widget.slot.branch.name), style: GoogleFonts.manrope())
          ],
        ),
      ),
    );
  }

  Widget _available() {
    return Container(
      width: 12,
      height: 12,
      decoration: BoxDecoration(
        color: availableColor,
        shape: BoxShape.circle,
      ),
    );
  }

  Widget _danger() {
    return Container(
      width: 12,
      height: 12,
      decoration: BoxDecoration(
        color: dangerColor,
        shape: BoxShape.circle,
      ),
    );
  }

  String _branchName(String branchName) {
    if (branchName.length > 10) {
      return branchName.substring(0, 10) + "...";
    }
    return branchName;
  }
}
