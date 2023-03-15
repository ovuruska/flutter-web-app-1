import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../injection.dart';
import '../bloc/no_show_rate_bloc.dart';
import '../bloc/no_show_rate_state.dart';
import '../widgets/no_show_rate.dart';

class NoShowRateView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NoShowRateBloc, NoShowRateState>(
      bloc: sl<NoShowRateBloc>(),
      builder: (context, state) {
        if (state is NoShowRateInitial) {
          return Container();
        } else if (state is NoShowRateLoadingState) {
          return Container();
        } else if (state is NoShowRateLoaded) {
          return NoShowRate(cancellationRate: state.cancellationRate);
        }else {
          return Container();
        }
      },
    );
  }
}
