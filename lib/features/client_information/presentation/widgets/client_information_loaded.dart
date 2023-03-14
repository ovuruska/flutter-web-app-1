

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../domain/entities/client_information.dart';

class ClientInformationLoadedView extends StatelessWidget {
  final ClientInformation client;

  const ClientInformationLoadedView({Key? key, required this.client}) : super(key: key);

  List<String> _nameAndSurname(String name){
    List<String> nameAndSurname = name.split(" ");
    if(nameAndSurname.length == 1){
      nameAndSurname.add("");
    }
    return <String>[nameAndSurname.first,nameAndSurname.last];
  }

  Text _name(String name) => Text(name,style: GoogleFonts.inter(
    textStyle:TextStyle(
      fontSize: 16,
      color:const Color(0xFF252C32),
      fontWeight: FontWeight.w600,
    ),
  ));

  Text _label(String label) => Text(label,style: GoogleFonts.poppins(
    textStyle:TextStyle(
      fontSize: 16,
      color:const Color(0xFF6E7C87),
    ),
  ));

  @override
  Widget build(BuildContext context) {
    var nameAndSurname = _nameAndSurname(client.name);
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
    crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Text("Client Information",style: GoogleFonts.poppins(
          textStyle:TextStyle(
            color:const Color(0xFF000000),
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),),
       Row(
         mainAxisSize: MainAxisSize.max,
         crossAxisAlignment: CrossAxisAlignment.center,
         children: [
           Expanded(
             child:_label("Client ID")
           ),
            Expanded(
              child:Text(client.id.toString())
            ),
         ],
       ),
        Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
                child:_label("Name")
            ),
            Expanded(
                child:Text(nameAndSurname.first)
            ),
          ],
        ),
        Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
                child:_label("Surname")
            ),
            Expanded(
                child:Text(nameAndSurname.last)
            ),
          ],
        ),
        Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
                child:_label("Email")
            ),
            Expanded(
                child:Text(client.email)
            ),
          ],
        ),
        Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
                child:_label("Phone")
            ),
            Expanded(
                child:Text(client.phoneNumber)
            ),
          ],
        ),
      ],
    );
  }

}