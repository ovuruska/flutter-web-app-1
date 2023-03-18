import 'package:shimmer/shimmer.dart';
import 'package:flutter/material.dart';

class ClientInformationLoadingView extends StatelessWidget {
  const ClientInformationLoadingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
    var width = MediaQuery
        .of(context)
        .size
        .width;
    var height = MediaQuery
        .of(context)
        .size
        .height;

    return Container(
    width: width,
    height: height,
        child:Shimmer.fromColors(baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,child:Container(
        color:Colors.white,
        height: width,
        width: height,)));
  }
}