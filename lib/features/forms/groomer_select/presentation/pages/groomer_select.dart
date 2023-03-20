

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../injection.dart';
import '../bloc/groomer_select_bloc.dart';
import '../bloc/groomer_select_state.dart';
import '../widgets/groomer_select.dart';

class GroomerSelectView extends StatelessWidget {
  const GroomerSelectView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GroomerSelectBloc,GroomerSelectState>(
      bloc:sl<GroomerSelectBloc>(),
      builder: (context, state) {
        return GroomerSelect(
          options: state.options,
        );
      },
    );
  }
}