import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scrubbers_employee_application/features/client_search/domain/entities/client_search_entity.dart';
import 'package:scrubbers_employee_application/features/client_search/presentation/bloc/client_search_event.dart';
import 'package:stream_transform/stream_transform.dart';

import '../../../../injection.dart';
import '../bloc/client_search_bloc.dart';
import '../bloc/client_search_state.dart';
import '../widgets/client_list.dart';
import '../widgets/general_search.dart';

class ClientSearchView extends StatefulWidget {
  @override
  _ClientSearchViewState createState() => _ClientSearchViewState();
}

class _ClientSearchViewState extends State<ClientSearchView> {
  StreamController<String> streamController = StreamController();

  onSubmitted(String query) {
    sl<ClientSearchBloc>().add(ClientSearchQueryChanged(query: query));
  }

  @override
  void initState() {
    streamController.stream
        .debounce(Duration(milliseconds: 2000))
        .listen((s) {})
        .onData((data) {
      onSubmitted(data);
    });
    sl<ClientSearchBloc>().add(ClientSearchQueryChanged(query: ''));
    super.initState();
  }

  dispose() {
    streamController.close();
    super.dispose();
  }

  onChanged(String query) {
    streamController.add(query);
  }

  _scaffold({Widget? child}) => Scaffold(
      backgroundColor: const Color(0xFFF6F8F9),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GeneralSearch(
            onChanged: onChanged,
            onSubmitted: onSubmitted,
          ),
          Container(height: 32),
          child != null ? Expanded(child: child) : Container()
        ],
      ));

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ClientSearchBloc, ClientSearchState>(
      bloc: sl<ClientSearchBloc>(),
      builder: (context, state) {
        if (state is Initial) {
          return _scaffold();
        } else if (state is Loading) {
          return _scaffold(
              child: Center(
            child: CircularProgressIndicator(
              color: const Color(0xFF5B6871),
            ),
          ));
        } else if (state is Loaded) {
          var clients = state.clients as List<ClientSearchEntity>;

          return _scaffold(
              child: ClientList(clients: clients, query: state.query));
        } else {
          return _scaffold();
        }
      },
    );
  }
}
