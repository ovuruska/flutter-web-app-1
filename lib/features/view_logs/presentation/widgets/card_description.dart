import 'package:flutter/material.dart';

import '../../../../flutter_flow/flutter_flow_theme.dart';

class CardDescription extends StatelessWidget {

  final String description;
  const CardDescription({Key? key, required this.description}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Description",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),),
          Container(height: 8,),
            Expanded(child:Container(
            decoration: BoxDecoration(
              color:FlutterFlowTheme.of(context).primaryColor.withOpacity(.5),
              borderRadius: BorderRadius.circular(8)
            ),
            padding: EdgeInsets.all(8),
            child: Text(description),
          ))
        ],
    );
  }
}
