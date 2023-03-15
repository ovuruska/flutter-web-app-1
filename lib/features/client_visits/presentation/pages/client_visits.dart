import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../injection.dart';
import '../bloc/client_visits_bloc.dart';
import '../bloc/client_visits_state.dart';
import '../widgets/client_visits.dart';

class ClientVisitsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ClientVisitsBloc, ClientVisitsState>(
        bloc: sl<ClientVisitsBloc>(),
        builder: (context, state) {
          if (state is ClientVisitsLoaded) {
            return ClientVisits(data: state.data);
          } else {
            return Container();
          }
        });
  }
}
