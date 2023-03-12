import 'package:shimmer/shimmer.dart';
import 'package:flutter/material.dart';

class CalendarAndBranchLoading extends StatelessWidget {
  const CalendarAndBranchLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height:double.infinity,
        width:double.infinity,
        child:Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: Column(
            children: [
              Container(
                height: 64,
                width: double.infinity,
              ),
              Expanded(
              child:Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.white,
                ),
              ),
              )
            ]
              )

             
          ),
        ),
    );
  }
}