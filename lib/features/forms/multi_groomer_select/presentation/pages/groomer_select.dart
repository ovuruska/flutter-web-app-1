

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../injection.dart';
import '../bloc/groomer_select_bloc.dart';
import '../bloc/groomer_select_event.dart';
import '../bloc/groomer_select_state.dart';
import '../widgets/groomer_select.dart';

class MultiGroomerSelectView extends StatefulWidget {
  const MultiGroomerSelectView({Key? key}) : super(key: key);

  @override
  _MultiGroomerSelectViewState createState() => _MultiGroomerSelectViewState();
}

class _MultiGroomerSelectViewState extends State<MultiGroomerSelectView> {

  @override
  void initState() {
    super.initState();
    sl<MultiGroomerSelectBloc>().add(MultiGroomerSelectEventFetch());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MultiGroomerSelectBloc, MultiGroomerSelectState>(
      bloc: sl<MultiGroomerSelectBloc>(),
      builder: (context, state) {
        return MultiGroomerSelect(
          options: state.options,
        );
      },
    );
  }

}