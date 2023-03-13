

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scrubbers_employee_application/features/client_search/domain/entities/client_search_entity.dart';
import 'package:scrubbers_employee_application/features/client_search/presentation/bloc/client_search_event.dart';
import 'package:stream_transform/stream_transform.dart';

import '../../../../injection.dart';
import '../bloc/client_search_bloc.dart';
import '../bloc/client_search_state.dart';
import '../widgets/client_search_initial.dart';
import '../widgets/client_search_loaded.dart';
import '../widgets/client_search_loading.dart';

class ClientSearchView extends StatefulWidget {
  @override
  _ClientSearchViewState createState() => _ClientSearchViewState();


}

class _ClientSearchViewState extends State<ClientSearchView> {
  StreamController<String> streamController = StreamController();
  @override
  void initState() {
    streamController.stream
        .debounce(Duration(milliseconds: 2000))
        .listen((s) {})
        .onData((data) {
          sl<ClientSearchBloc>().add(ClientSearchQueryChanged(query: data));
    });

    super.initState();
  }
  dispose(){
    streamController.close();
    super.dispose();
  }

  onChanged(String query){
    streamController.add(query);
  }


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ClientSearchBloc,ClientSearchState>(
      bloc:sl<ClientSearchBloc>(),
      builder: (context,state){
        if(state is Initial){
          return ClientSearchInitial(
            onChanged: onChanged,
          );
        }
        else if(state is Loading){
          return ClientSearchLoading();
        }
        else if(state is Loaded){
          var clients = state.clients as List<ClientSearchEntity>;
          return ClientSearchLoaded(clients: clients,query: state.query);
        }
        else{
          return ClientSearchInitial();
        }
      },
    );
  }
}
