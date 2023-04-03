import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:scrubbers_employee_application/core/domain/entities/daily_slot.dart';

const Color dangerColor = Color(0xFFFF424B);

const Color availableColor = Color(0xFF3DBF3B);


class BranchSlot extends StatelessWidget{

  final DailySlotEntity dailySlotEntity;
  final Function(DailySlotEntity)? onClick;

  BranchSlot({required this.dailySlotEntity, this.onClick});


  Widget _available(){
    return Container(
      width: 12,
      height: 12,
      decoration: BoxDecoration(
        color: availableColor,
        shape: BoxShape.circle,
      ),
    );
  }

  Widget _danger(){
    return Container(
      width: 12,
      height: 12,
      decoration: BoxDecoration(
        color: dangerColor,
        shape: BoxShape.circle,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Mon - 12/23/2022
    var formatter = new DateFormat('EEE - MM/dd/yyyy');
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: const Color(0xFFE9ECEF),width:2),

        borderRadius: BorderRadius.circular(8),
      ),
      child:Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children:[
          // Generate two circle
          dailySlotEntity.morningCapacity > .6 ? _available() : _danger(),
          Container(width:4),
          dailySlotEntity.afternoonCapacity > .6 ? _available() : _danger(),
          Container(width:8),

          Text(formatter.format(dailySlotEntity.date),style:GoogleFonts.manrope()),
          Container(width:4),

          Text("|",style:GoogleFonts.manrope(fontSize:16)),
          Container(width:4),
          Text(dailySlotEntity.branch.name,style:GoogleFonts.manrope())


        ]
      )
    );
  }

}