import 'package:flutter/material.dart';

import '../../../../common/shadow.dart';

class ClientNotes extends StatelessWidget {

  final String notes;

  const ClientNotes({Key? key, required this.notes}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    return ShadowContainer(
        child:Container(

            width: MediaQuery.of(context).size.width * .8,
            height: 128,
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                      padding: EdgeInsets.all(8),
                      child: Title(
                          color: Color(0xFF3894D7),
                          child: Text("Customer Notes",
                              style: TextStyle(fontWeight: FontWeight.bold)))),
                  Padding(padding: EdgeInsets.all(8), child: Text(notes))
                ])));
  }

}