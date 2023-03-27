

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:scrubbers_employee_application/common/scheduling/models/scheduling_appointment_entity.dart';
import 'package:scrubbers_employee_application/features/appointment_schedule/utils/go_to.dart';

import '../../../../core/domain/entities/appointment_slot_entity.dart';

class AppointmentSlotCard extends StatelessWidget {
  final AppointmentSlotEntity slot;
  final Function(AppointmentSlotEntity)? onTap;
  final formatter = new DateFormat('EEE - dd/MM/yyyy');

  AppointmentSlotCard({
    Key? key,
    required this.slot,
    required this.onTap,
  }) : super(key: key);

  String getDate(DateTime date) {
    return formatter.format(date);
  }

  String getEmployee(String name){
    if(name == null){
      return "";
    }else{
      return name.split(" ")[0];
    }
  }

  String getBranch(String name){
    if(name == null){
      return "";
    }else{
      // Get first 10 characters
      return name.substring(0, 10);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {
          onTap?.call(slot);
          goToWithDetails(
            branch: slot.branch.id,
            employee: slot.employee.id,
            date: slot.start,
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                getDate(slot.start),
                style: GoogleFonts.inter(
                  fontSize:12,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF000000),
                ),
              ),
              // Add divider
              Text(
                " | " + getEmployee(slot.employee.name),
                style: GoogleFonts.inter(
                  fontSize:12,
                  color: Color(0xFF000000),
                ),
              ),
              Text(
                " | " + getBranch(slot.branch.name),
                style: GoogleFonts.inter(
                  fontSize:12,
                  color: Color(0xFF000000),
                ),
              ),


            ],
          ),
        ),
      ),
    );
  }
}