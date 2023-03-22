

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../injection.dart';
import '../bloc/product_select_bloc.dart';
import '../bloc/product_select_event.dart';
import '../bloc/product_select_state.dart';
import '../widgets/product_select.dart';

class MultiProductSelectView extends StatefulWidget{

  @override
  _MultiProductSelectViewState createState() => _MultiProductSelectViewState();
}

class _MultiProductSelectViewState extends State<MultiProductSelectView>{
  void initState(){
    super.initState();
    sl<MultiProductSelectBloc>().add(MultiProductSelectEventFetch());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MultiProductSelectBloc,MultiProductSelectState>(
      bloc: sl<MultiProductSelectBloc>(),
      builder: (context,state){
        return MultiProductSelect(
          options: state.options,
        );
      },
    );
  }

}