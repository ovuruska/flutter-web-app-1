

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../injection.dart';
import '../bloc/groomer_select_bloc.dart';
import '../bloc/groomer_select_event.dart';
import '../bloc/groomer_select_state.dart';
import '../widgets/groomer_select.dart';

class GroomerSelectView extends StatefulWidget {
  const GroomerSelectView({Key? key}) : super(key: key);

  @override
  _GroomerSelectViewState createState() => _GroomerSelectViewState();
}

class _GroomerSelectViewState extends State<GroomerSelectView> {

  @override
  void initState() {
    super.initState();
    sl<GroomerSelectBloc>().add(GroomerSelectEventFetch());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GroomerSelectBloc, GroomerSelectState>(
      bloc: sl<GroomerSelectBloc>(),
      builder: (context, state) {
        return GroomerSelect(
          options: state.options,
        );
      },
    );
  }

}