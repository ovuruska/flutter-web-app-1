

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../injection.dart';
import '../blocs/client_top_category_bloc.dart';
import '../blocs/client_top_category_state.dart';
import '../widgets/client_top_category.dart';

class ClientTopCategoryView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ClientTopCategoryBloc, ClientTopCategoryState>(
      bloc:sl<ClientTopCategoryBloc>(),
      builder: (context, state) {
        if (state is ClientTopCategoryInitial) {
          return Container();
        } else if (state is ClientTopCategoryLoading) {
          return Container();
        } else if (state is ClientTopCategoryLoaded) {
          return ClientTopCategory(data: state.data);
        } else {
          return Container();
        }
      },
    );
  }



}