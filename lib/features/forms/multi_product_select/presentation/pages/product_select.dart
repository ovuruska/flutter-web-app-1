

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/domain/entities/product_entity.dart';
import '../../../../../injection.dart';
import '../bloc/product_select_bloc.dart';
import '../bloc/product_select_event.dart';
import '../bloc/product_select_state.dart';
import '../widgets/product_select.dart';

class MultiProductSelectView extends StatefulWidget{

  final List<ProductEntity>? initialValue;
  final Function(List<ProductEntity>)? onSelected;

  const MultiProductSelectView({Key? key, this.onSelected, this.initialValue}) : super(key: key);

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
          initialValue: widget.initialValue ?? [],
          onSelected: widget.onSelected,
          options: state.options,
        );
      },
    );
  }

}