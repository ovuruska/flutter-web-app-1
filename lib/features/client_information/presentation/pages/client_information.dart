import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../injection.dart';
import '../bloc/client_information_bloc.dart';
import '../bloc/client_information_state.dart';
import '../widgets/client_information_loaded.dart';
import '../widgets/client_information_loading.dart';

class ClientInformationView extends StatefulWidget {
  @override
  _ClientInformationViewState createState() => _ClientInformationViewState();
}

class _ClientInformationViewState extends State<ClientInformationView> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ClientInformationBloc, ClientInformationState>(
      bloc: sl<ClientInformationBloc>(),
      builder: (context, state) {
        if (state is ClientInformationLoaded) {
          var loadedState = state as ClientInformationLoaded;
          var clientInformation = loadedState.clientInformation;
          return Scaffold(
              body: ClientInformationLoadedView(client: clientInformation));
        } else if (state is ClientInformationLoading) {
          return Scaffold(body: ClientInformationLoadingView());
        } else {
          return Container();
        }
      },
    );
  }
}
