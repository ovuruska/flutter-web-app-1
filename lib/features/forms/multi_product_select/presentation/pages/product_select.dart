

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../injection.dart';
import '../bloc/product_select_bloc.dart';
import '../bloc/product_select_event.dart';
import '../bloc/product_select_state.dart';
import '../widgets/product_select.dart';

class ProductSelectView extends StatefulWidget{

  @override
  _ProductSelectViewState createState() => _ProductSelectViewState();
}

class _ProductSelectViewState extends State<ProductSelectView>{
  void initState(){
    super.initState();
    sl<ProductSelectBloc>().add(ProductSelectEventFetch());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductSelectBloc,ProductSelectState>(
      bloc: sl<ProductSelectBloc>(),
      builder: (context,state){
        return ProductSelect(
          options: state.options,
        );
      },
    );
  }

}